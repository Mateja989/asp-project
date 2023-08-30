using JobFinder.Application.DTOs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation.UseCases.Command.Abstract;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Users
{
    public class EfDeleteUserCommand : DeleteCommandBase<DeleteDTO<User>, User>
    {
        public EfDeleteUserCommand(JobFinderDBContext context) : base(context)
        {
        }

        public override int Id => 27;

        public override string Name => "Delete user command.";

        public override string Description => "Delete user command using EF.";
    }
}
