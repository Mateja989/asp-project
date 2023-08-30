using AutoMapper;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class SkillProfile : Profile
    {
        public SkillProfile()
        {
            CreateMap<SkillDTO, Skill>();
            CreateMap<Skill, SkillDTO>();
        }
    }
}
