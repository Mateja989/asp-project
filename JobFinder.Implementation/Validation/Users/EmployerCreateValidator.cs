using FluentValidation;
using JobFinder.Application.DTOs.Users;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation.Users
{
    public class EmployerCreateValidator : UserValidator<EmployerDto>
    {
        public EmployerCreateValidator(JobFinderDBContext context) : base(context)
        {
        }

        protected override void SpecificValidatorForDiffrentType()
        {

            RuleFor(dto => dto.City)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("City is required.")
                .Matches("^[a-zA-Z\\s]*$").WithMessage("Invalid city format.");

            RuleFor(dto => dto.Country)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Country is required.")
                .Matches("^[a-zA-Z\\s]*$").WithMessage("Invalid country format.");

            RuleFor(dto => dto.Company)
               .Cascade(CascadeMode.Stop)
               .NotEmpty().WithMessage("Company name is required.")
               .Matches("^[a-zA-Z0-9\\s]*$").WithMessage("Invalid company name format.")
               .Must(BeUniqueCompany).WithMessage("Company name must be unique.");
        }

        private bool BeUniqueCompany(string companyName)
        {
            return !_context.Users.OfType<Employer>().Any(e => e.Company == companyName);
        }

        
    }
}
