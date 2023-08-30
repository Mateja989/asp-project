using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Users
{
    public class EfGetCandidatesQuery : EfUseCase, IGetCandidatesQuery
    {
        private readonly IMapper _mapper;
        public EfGetCandidatesQuery(JobFinderDBContext context, IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 3;

        public string Name => "Get all candidates.";

        public string Description => "Get all candidates with Entity framework.";

        public IEnumerable<CandidateCreateDTO> Execute(BaseSearch request)
        {
            IQueryable<Candidate> query = Context.Users.OfType<Candidate>();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(candidate =>
                    candidate.FirstName.Contains(request.Keyword) ||
                    candidate.LastName.Contains(request.Keyword) ||
                    candidate.LinkedInProfile.Contains(request.Keyword) ||
                    candidate.Username.Contains(request.Keyword) ||
                    candidate.Email.Contains(request.Keyword));
            }

            var candidates = query
                .Select(candidate => _mapper.Map<CandidateCreateDTO>(candidate))
                .ToList();

            return candidates;
        }
    }
}
