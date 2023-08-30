using JobFinder.Application.DTOs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation.UseCases.Command.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Categories
{
    public class EfDeleteCategoryCommand : DeleteCommandBase<DeleteDTO<Category>, Category>
    {
        public EfDeleteCategoryCommand(JobFinderDBContext context) : base(context)
        {
        }

        public override int Id => 12;

        public override string Name => "Delete category command.";

        public override string Description => "Delete category command using EF.";
    }
}
