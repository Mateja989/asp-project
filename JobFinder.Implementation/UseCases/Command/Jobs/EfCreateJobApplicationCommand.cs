using AutoMapper;
using JobFinder.Application;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation.UseCases.Command.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Jobs
{
    public class EfCreateJobApplicationCommand : CreateCommandBase<JobApplicationCreateDTO, JobApplication>
    {
        public EfCreateJobApplicationCommand(JobFinderDBContext context, IMapper mapper, IValidationFactory factory) : base(context, mapper, factory)
        {
        }

        public override int Id => 22;

        public override string Name => "Create Application for job by user.";

        public override string Description => "Create Application for job by user using Ef.";
    }
}
