using AutoMapper;
using JobFinder.Application;
using JobFinder.Application.DTOs.Skills;
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
    public class EfCreateSkillCommand : CreateCommandBase<SkillDTO, Skill>
    {
        public EfCreateSkillCommand(JobFinderDBContext context, 
                                    IMapper mapper, 
                                    IValidationFactory factory)
            : base(context, mapper, factory)
        {
        }

        public override int Id => 9;

        public override string Name => "Create skill command.";

        public override string Description => "Create skill command using Entity framework.";
    }
}
