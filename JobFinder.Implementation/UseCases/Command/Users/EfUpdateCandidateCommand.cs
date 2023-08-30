using AutoMapper;
using JobFinder.Application;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases;
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
    public class EfUpdateCandidateCommand : UpdateCommandBase<CandidateUpdateDTO, Candidate>
    {
        public EfUpdateCandidateCommand(JobFinderDBContext context, 
                                        IMapper mapper, 
                                        IValidationFactory factory, 
                                        IApplicationUser user) 
            : base(context, mapper, factory, user)
        {
        }

        public override int Id => 2;
        public override string Name => "Update command.";
        public override string Description => "Neki tekst";

    }

}
