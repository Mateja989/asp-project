using AutoMapper;
using JobFinder.Application;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases.Command;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation.UseCases.Command.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Users
{
    public class EfCreateCandidateCommand : CreateCommandBase<CandidateCreateDTO, Candidate>
    {
        public EfCreateCandidateCommand(JobFinderDBContext context, IMapper mapper, IValidationFactory factory)
            : base(context, mapper, factory)
        {
        }

        public override int Id => 1;

        public override string Name => "Create Candidate Command.";

        public override string Description => "Create Candidate Command with Entity framework.";
    }

}
