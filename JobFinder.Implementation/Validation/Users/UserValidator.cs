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
                .NotEmpty().WithMessage("Ime je obavezan podatak.")
                .Matches("^[a-zA-Z]+$").WithMessage("Nevažeći format imena.");

            RuleFor(dto => dto.LastName)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Prezime je obavezan podatak.")
                .Matches("^[a-zA-Z]+$").WithMessage("Nevažeći format prezimena.");

            RuleFor(dto => dto.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email je obavezan podatak.")
                .EmailAddress().WithMessage("Nevažeći format email adrese.")
                .Must(BeUniqueEmail).WithMessage("Email adresa {PropertyValue} je već u upotrebi.");

            RuleFor(dto => dto.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Korisničko ime je obavezan podatak.")
                .MinimumLength(3).WithMessage("Minimalan broj karaktera je 3.")
                .MaximumLength(12).WithMessage("Maksimalan broj karaktera je 12.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Nevažeći format korisničkog imena.")
                .Must(BeUniqueUsername).WithMessage("Korisničko ime {PropertyValue} je već u upotrebi.");

            RuleFor(dto => dto.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Lozinka je obavezan podatak.")
                .MinimumLength(6).WithMessage("Minimalan broj karaktera za lozinku je 6.")
                .MaximumLength(200).WithMessage("Maksimalan broj karaktera za lozinku je 200.");

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
