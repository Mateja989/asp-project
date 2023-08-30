using AutoMapper;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Intrinsics.X86;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Jobs
{
    public class EfGetJobAdsQuery : EfUseCase,IGetJobAdsQuery
    {
        private readonly IMapper _mapper; 
        public EfGetJobAdsQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 35;

        public string Name => "Get all active job ads.";

        public string Description => "Get all active job ads using EF.";

        public IEnumerable<JobAdDisplayDTO> Execute(JobAdSearch request)
        {
            IQueryable<JobAd> query = Context.JobAds
                                                .Include(ja => ja.Job)
                                                    .ThenInclude(j => j.Experience) 
                                                .Include(ja => ja.SalaryType)
                                                .Include(ja => ja.JobSkills)
                                                    .ThenInclude(js => js.Skill);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(ja => ja.Job.Title.Contains(request.Keyword));
            }

            if (request.ExperienceId.HasValue)
            {
                query = query.Where(ja => ja.Job.ExperienceId == request.ExperienceId.Value);
            }

            if (request.EndedAt.HasValue)
            {
                query = query.Where(ja => ja.EndAt <= request.EndedAt.Value);
            }

            if (request.SalaryTypeId.HasValue)
            {
                query = query.Where(ja => ja.SalaryTypeId == request.SalaryTypeId.Value);
            }

            if (request.SkillIds.Any())
            {
                query = query.Where(ja => ja.JobSkills.Any(js => request.SkillIds.Contains(js.SkillId)));
            }

            var jobs = query
                .Select(jobs => _mapper.Map<JobAdDisplayDTO>(jobs))
                .ToList();

            return jobs;
        }
    }
}
