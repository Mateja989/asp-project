using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query.Skills;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Skills
{
    public class EfFindSkillQuery : EfUseCase, IFindSkillQuery
    {
        private IMapper _mapper;
        public EfFindSkillQuery(JobFinderDBContext context,
                IMapper maper) : base(context)
        {
            _mapper = maper;
        }

        public int Id => 11;

        public string Name => "Find skill by ID.";

        public string Description => "Find skill by ID using Entity framework.";

        public SkillDTO Execute(int request)
        {
            var skillEntity = Context.Skills.FirstOrDefault(c => c.Id == request);

            if (skillEntity == null)
            {
                //return NotFound("Candidate not found.");
            }


            return _mapper.Map<SkillDTO>(skillEntity);

        }
    }
}
