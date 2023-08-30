using AutoMapper;
using JobFinder.Application.DTOs;
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
    public class EfFindCandidateQuery : EfUseCase, IFindCandidateQuery
    {
        private readonly IMapper _mapper;
        public EfFindCandidateQuery(JobFinderDBContext context, IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Find candidate by ID.";

        public string Description => "Find candidate by ID using Entity framework.";

        public CandidateCreateDTO Execute(int request)
        {
            var candidateEntity = Context.Users.OfType<Candidate>().FirstOrDefault(c => c.Id == request);

            if (candidateEntity == null)
            {
                //return NotFound("Candidate not found.");
            }

          
            return _mapper.Map<CandidateCreateDTO>(candidateEntity);

        }
    }
}
