using FluentValidation;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Users;
using JobFinder.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation.Users
{
    public class CandidateCreateValidation : UserValidator<CandidateCreateDTO>
    {
        public CandidateCreateValidation(JobFinderDBContext context) : base(context)
        {
        }

        protected override void SpecificValidatorForDiffrentType()
        {
            RuleFor(dto => dto.PersonalWebsite)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Personal website URL is required.")
                .Matches(@"^(http|https)://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")
                .WithMessage("Invalid personal website URL.");

            RuleFor(dto => dto.Degree)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .WithMessage("Degree is required.");


            RuleFor(dto => dto.Phone)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .Matches("^[0-9]+$")
                .WithMessage("Invalid phone number.");

            RuleFor(dto => dto.CV).NotEmpty().WithMessage("CV link is required.");
        }
    }
}
