using AutoMapper;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Jobs
{
    public class EfGetJobsQuery : EfUseCase, IGetJobsQuery
    {
        private readonly IMapper _mapper;
        public EfGetJobsQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 15;

        public string Name => "Get all job for authorized user.";

        public string Description => "Get all job for authorized user with using Entity framework.";

        public IEnumerable<JobDisplayDTO> Execute(BaseSearch request)
        {
            IQueryable<Job> query = Context.Jobs
                .Include(job => job.Experience)
                .Include(job => job.Category);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(candidate => candidate.Title.Contains(request.Keyword));
            }

            var jobs = query
                .Select(jobs => _mapper.Map<JobDisplayDTO>(jobs))
                .ToList();

            return jobs;
        }
    }
}
