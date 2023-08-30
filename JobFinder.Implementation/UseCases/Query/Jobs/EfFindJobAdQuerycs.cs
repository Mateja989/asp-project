using AutoMapper;
using JobFinder.Application.DTOs.Jobs;
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
    public class EfFindJobAdQuerycs : EfUseCase,IFindJobAdQuery
    {
        private readonly IMapper _mapper;
        public EfFindJobAdQuerycs(JobFinderDBContext context,IMapper maper) : base(context)
        {
            _mapper = maper;
        }

        public int Id => 31;

        public string Name => "Find JobAd by ID.";

        public string Description => "Find JobAd by ID using EF.";

        public JobAdDisplayDTO Execute(int request)
        {
            var skillEntity = Context.JobAds
                            .Include(ja => ja.Job)
                                .ThenInclude(j => j.Experience)
                            .Include(ja => ja.SalaryType)
                            .Include(ja => ja.JobSkills)
                                .ThenInclude(js => js.Skill)
                            .FirstOrDefault(ja => ja.Id == request);

            if (skillEntity == null)
            {
                //return NotFound("JobAd not found.");
            }

            var jobAdDto = new JobAdDisplayDTO
            {
                Title = skillEntity.Job.Title,
                SalaryTypeName = skillEntity.SalaryType.Name,
                ExperienceName = skillEntity.Job.Experience.Name,
                SalaryRange = $"{skillEntity.SalaryMin} - {skillEntity.SalaryMax}",
                DaysLeft = (skillEntity.EndAt - DateTime.Now).Days,
                SkillNames = skillEntity.JobSkills.Select(js => js.Skill.Name).ToList()
            };

            return jobAdDto;
        }
    }
}
