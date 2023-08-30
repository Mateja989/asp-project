using AutoMapper;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases;
using JobFinder.Application.UseCases.Query;
using JobFinder.Application.UseCases.Query.Skills;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Skills
{
    public class EFGetSkillsQuery : EfUseCase,IGetSkillsQuery
    {
        private readonly IMapper _mapper;
        public EFGetSkillsQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
           _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "Get all skills.";

        public string Description => "Get all skills with filter using Entity framework.";

        public PagedResponse<SkillDTO> Execute(BasePagedSearch request)
        {
            IQueryable<Skill> query = Context.Skills; 

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(candidate => candidate.Name.Contains(request.Keyword));
            }

            if(request.PerPage == null || request.PerPage < 1)
            {
                request.PerPage = 15;
            }

            if (request.Page == null || request.Page < 1)
            {
                request.Page = 15;
            }

            var toSkip = (request.Page.Value -1 ) * request.PerPage.Value;

            var response = new PagedResponse<SkillDTO>();

            response.TotalCount = query.Count();

            response.Data = query.Skip(toSkip)
                                 .Take(request.PerPage.Value)
                                 .Select(query => _mapper.Map<SkillDTO>(query))
                                 .ToList();

            response.CurrentPage = request.Page.Value;

            response.ItemsPerPage = request.PerPage.Value;

            return response;
        }

      
    }
}
