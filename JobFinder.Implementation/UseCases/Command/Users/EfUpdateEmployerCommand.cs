
using AutoMapper;
using JobFinder.Application;
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
    public class EfUpdateEmployerCommand : UpdateCommandBase<EmployerUpdateDTO, Employer>
    {
        public EfUpdateEmployerCommand(JobFinderDBContext context,
                                       IMapper mapper, 
                                       IValidationFactory factory,
                                       IApplicationUser user) 
            : base(context, mapper, factory, user)
        {
        }

        public override int Id => 6;

        public override string Name => "Edit employer with given ID.";

        public override string Description => "Edit employer with given ID using EF.";
    }
}
