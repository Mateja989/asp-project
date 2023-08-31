using FluentValidation;
using JobFinder.Application.DTOs.Users;
using JobFinder.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation.Users
{
    public abstract class UserValidator<TDto> : AbstractValidator<TDto>
        where TDto : UserDTO
    {
        protected readonly JobFinderDBContext _context;

        public UserValidator(JobFinderDBContext context)
        {
            _context = context;

            RuleFor(dto => dto.FirstName)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Name is a required field.")
                .Matches("^[a-zA-Z]+$").WithMessage("Invalid name format.");

            RuleFor(dto => dto.LastName)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Lastname is a required field.")
                .Matches("^[a-zA-Z]+$").WithMessage("Invalid last name format.");

            RuleFor(dto => dto.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Emails a required field.")
                .EmailAddress().WithMessage("Invalid email format.")
                .Must(BeUniqueEmail).WithMessage("The email address {PropertyValue} is already in use.");

            RuleFor(dto => dto.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Userame is a required field.")
                .MinimumLength(3).WithMessage("The minimum number of characters is 3.")
                .MaximumLength(12).WithMessage("The maximum number of characters is 12.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Invalid username format.")
                .Must(BeUniqueUsername).WithMessage("The username {PropertyValue} is already in use.");

            RuleFor(dto => dto.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Password is a required field.")
                .MinimumLength(6).WithMessage("The minimum number of characters is 12.")
                .MaximumLength(50).WithMessage("The maximum number of characters is 50.");

            SpecificValidatorForDiffrentType();
        }

        protected abstract void SpecificValidatorForDiffrentType();

        private bool BeUniqueEmail(string email)
        {
            return !_context.Users.Any(user => user.Email == email);
        }

        private bool BeUniqueUsername(string username)
        {
            return !_context.Users.Any(user => user.Username == username);
        }
    }
}
