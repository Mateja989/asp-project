using FluentValidation;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation.Jobs
{
    public class CreateJobAdValidator : AbstractValidator<JobAdCreateDTO>
    {
        private readonly JobFinderDBContext _context;
        public CreateJobAdValidator(JobFinderDBContext context) {
            
            _context = context;

            RuleFor(dto => dto.JobTypeId)
               .Cascade(CascadeMode.Stop)
               .NotEmpty().WithMessage("JobType is required.")
               .Must(BeExistingJobType).WithMessage("Invalid JobType.");

            RuleFor(dto => dto.SalaryTypeId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("SalaryType is required.")
                .Must(BeExistingSalaryType).WithMessage("Invalid SalaryType.");

            RuleFor(dto => dto.JobId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("JobId is required.")
                .Must(BeExistingJob).WithMessage("Invalid JobId.");

            RuleFor(dto => dto.EndAt)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("EndAt is required.")
                .GreaterThanOrEqualTo(DateTime.Now).WithMessage("EndAt must be greater than or equal to current date.")
                .LessThanOrEqualTo(DateTime.Now.AddDays(30)).WithMessage("EndAt must be less than or equal to 30 days from now.");

            RuleFor(dto => dto.SalaryMin)
                .Cascade(CascadeMode.Stop)
                .GreaterThanOrEqualTo(0).WithMessage("SalaryMin must be greater than or equal to 0.");

            RuleFor(dto => dto.SalaryMax)
                .Cascade(CascadeMode.Stop)
                .GreaterThanOrEqualTo(dto => dto.SalaryMin).WithMessage("SalaryMax must be greater than or equal to SalaryMin.")
                .LessThanOrEqualTo(1000000).WithMessage("SalaryMax must be less than or equal to 1,000,000.");

            RuleFor(dto => dto.JobSkillIds)
           .Must(BeExistingSkills)
           .WithMessage("Jedna ili više veština nisu validne.");
        }

        private bool BeExistingJobType(int jobTypeId)
        {
            return _context.JobTypes.Any(jt => jt.Id == jobTypeId);
        }

        private bool BeExistingSalaryType(int salaryTypeId)
        {
            return _context.SalaryTypes.Any(st => st.Id == salaryTypeId);
        }
        private bool BeExistingSkills(List<int> skillIds)
        {
            return skillIds.All(skillId => _context.Skills.Any(s => s.Id == skillId));
        }
        private bool BeExistingJob(int jobId)
        {
            return _context.Jobs.Any(j => j.Id == jobId);
        }

    }
}
