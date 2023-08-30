using JobFinder.Application.DTOs;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation.UseCases.Command.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Skills
{
    public class EfDeleteSkillCommand : DeleteCommandBase<DeleteDTO<Skill>, Skill>
    {
        public EfDeleteSkillCommand(JobFinderDBContext context) : base(context)
        {
        }

        public override int Id => 25;

        public override string Name => "Delete Skill(soft delete).";

        public override string Description => "Delete Skill(soft delete) using EF.";
    }
}
