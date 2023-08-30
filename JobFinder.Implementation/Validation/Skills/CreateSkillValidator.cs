using FluentValidation;
using FluentValidation.Validators;
using JobFinder.Application.DTOs.Skills;
using JobFinder.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation.Skills
{
    public class CreateSkillValidator : AbstractValidator<SkillDTO>
    {
        private readonly JobFinderDBContext _context;
        public CreateSkillValidator(JobFinderDBContext context) {

            _context = context;

            RuleFor(dto => dto.Name)
                .NotEmpty().WithMessage("Skill name is required.")
                .Length(3, 20).WithMessage("Skill name must be between 3 and 20 characters.")
                .Matches("^[a-zA-Z]+$").WithMessage("Invalid format for skill name.")
                .Must(BeUniqueName).WithMessage("Skill with name '{PropertyValue}' already exists.");
        }

        private bool BeUniqueName(string name)
        {
            return !_context.Skills.Any(skill => skill.Name == name);
        }
    }
}
