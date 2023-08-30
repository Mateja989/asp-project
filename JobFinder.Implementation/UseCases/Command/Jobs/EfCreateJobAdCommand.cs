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
    public class EfCreateJobAdCommand : CreateCommandBase<JobAdCreateDTO, JobAd>
    {
        public EfCreateJobAdCommand(JobFinderDBContext context, 
                                    IMapper mapper,
                                    IValidationFactory factory) : base(context, mapper, factory)
        {
        }

        public override int Id => 21;

        public override string Name => "Create Job Ad.";

        public override string Description => "Create Job Ad using Entity framework";
    }
}
