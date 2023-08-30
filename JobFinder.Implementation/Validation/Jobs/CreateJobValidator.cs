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
    public class CreateJobValidator : AbstractValidator<JobDTO>
    {
        private readonly JobFinderDBContext _context;

        public CreateJobValidator(JobFinderDBContext context)
        {
            _context = context;

            RuleFor(dto => dto.Title)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Title is required.")
                .Length(10, 200).WithMessage("Title must be between 10 and 200 characters.");

            RuleFor(dto => dto.Description)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Description is required.")
                .Length(10, 200).WithMessage("Description must be between 10 and 200 characters.");

            RuleFor(dto => dto.ExperienceId)
                .Cascade(CascadeMode.Stop)
                .Must(BeExistingExperience).WithMessage("Invalid Experience ID.");

            RuleFor(dto => dto.EmployerId)
                .Cascade(CascadeMode.Stop)
                .Must(BeExistingEmployer).WithMessage("Invalid Employer ID.");

            RuleFor(dto => dto.CategoryId)
                .Cascade(CascadeMode.Stop)
                .Must(BeExistingCategory).WithMessage("Invalid Category ID.");

            /*RuleFor(dto => dto.SkillIds)
                .Cascade(CascadeMode.Stop)
                .Must(BeExistingSkills).WithMessage("Invalid Skill ID in SkillIds array.");*/
        }

        private bool BeExistingExperience(int experienceId)
        {
            return _context.Experiences.Any(e => e.Id == experienceId);
        }

        private bool BeExistingEmployer(int employerId)
        {
           return _context.Users.OfType<Employer>().Any(e => e.Id == employerId);
        }

        private bool BeExistingCategory(int categoryId)
        {
            return _context.Categories.Any(c => c.Id == categoryId);
        }

        /*private bool BeExistingSkills(List<int> skillIds)
        {
            return skillIds.All(skillId => _context.Skills.Any(s => s.Id == skillId));
        }*/

    }
}
