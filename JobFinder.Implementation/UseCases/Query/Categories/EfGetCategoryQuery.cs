using AutoMapper;
using JobFinder.Application.DTOs.Categories;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query;
using JobFinder.Application.UseCases.Query.Categories;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Categories
{
    public class EfGetCategoryQuery : EfUseCase,IGetCategoryQuery
    {
        private IMapper _mapper;
        public EfGetCategoryQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 36;

        public string Name => "Get all category.";

        public string Description => "Get all category using Ef.";

        public PagedResponse<CategoryDTO> Execute(BasePagedSearch request)
        {
            IQueryable<Category> query = Context.Categories
                                                .Include(x => x.Subcategories)
                                                .Where(x => x.DeletedAt == null);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(candidate => candidate.Name.Contains(request.Keyword));
            }

            if (request.PerPage == null || request.PerPage < 1)
            {
                request.PerPage = 15;
            }

            if (request.Page == null || request.Page < 1)
            {
                request.Page = 15;
            }

            var toSkip = (request.Page.Value - 1) * request.PerPage.Value;

            var response = new PagedResponse<CategoryDTO>();

            response.TotalCount = query.Count();

            response.Data = query.Skip(toSkip)
                                 .Take(request.PerPage.Value)
                                 .Select(query => _mapper.Map<CategoryDTO>(query))
                                 .ToList();

            response.CurrentPage = request.Page.Value;

            response.ItemsPerPage = request.PerPage.Value;

            return response;
        }
    }
}
