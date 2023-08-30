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
    public class CreateJobApplicationValidator : AbstractValidator<JobApplicationCreateDTO>
    {
        private readonly JobFinderDBContext _context;

        public CreateJobApplicationValidator(JobFinderDBContext context)
        {
            _context = context;

            RuleFor(dto => dto.JobAdId)
              .Cascade(CascadeMode.Stop)
              .NotEmpty().WithMessage("JobAdId is required.")
              .Must(BeExistingJobAd).WithMessage("JobAd with the specified Id does not exist.")
              .Must(BeJobAdNotEnded).WithMessage("JobAd has already ended.");

            RuleFor(dto => dto.CandidateId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("CandidateId is required.")
                .Must(BeExistingCandidate).WithMessage("Candidate with the specified Id does not exist.");
        }

        private bool BeExistingJobAd(int jobAdId)
        {
            return _context.JobAds.Any(ja => ja.Id == jobAdId);
        }

        private bool BeJobAdNotEnded(int jobAdId)
        {
            var jobAd = _context.JobAds.Find(jobAdId);
            return jobAd == null || jobAd.EndAt > DateTime.UtcNow;
        }

        private bool BeExistingCandidate(int candidateId)
        {
            return _context.Users.OfType<Candidate>().Any(c => c.Id == candidateId);
        }

    }
}
