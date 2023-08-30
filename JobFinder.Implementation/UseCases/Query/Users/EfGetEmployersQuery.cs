using AutoMapper;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Users
{
    public class EfGetEmployersQuery : EfUseCase, IGetEmployerQuery
    {
        private readonly IMapper _mapper;
        public EfGetEmployersQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 7;

        public string Name => "Get employers command.";

        public string Description => "Get employers command using EF.";

        public IEnumerable<EmployerDto> Execute(BaseSearch request)
        {
            IQueryable<Employer> query = Context.Users.OfType<Employer>();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(candidate =>
                    candidate.FirstName.Contains(request.Keyword) ||
                    candidate.LastName.Contains(request.Keyword) ||
                    candidate.Company.Contains(request.Keyword) ||
                    candidate.Username.Contains(request.Keyword) ||
                    candidate.Email.Contains(request.Keyword));
            }

            var candidates = query
                .Select(candidate => _mapper.Map<EmployerDto>(candidate))
                .ToList();

            return candidates;
        }
    }
}
