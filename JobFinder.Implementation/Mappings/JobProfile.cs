using AutoMapper;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class JobProfile : Profile
    {
        public JobProfile() {


            CreateMap<JobDTO, Job>()
                .ForMember(dest => dest.Id, opt => opt.Ignore());

            CreateMap<Job, JobDisplayDTO>()
                .ForMember(dest => dest.ExperienceName, opt => opt.MapFrom(src => src.Experience.Name))
                .ForMember(dest => dest.EmployerFullName, opt => opt.MapFrom(src => src.Employer.FirstName + " " + src.Employer.LastName))
                .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category.Name));


            CreateMap<JobAdCreateDTO, JobAd>()
            .ForMember(dest => dest.JobSkills, opt => opt.MapFrom(src => src.JobSkillIds.Select(skillId => new JobSkill { SkillId = skillId }).ToList()));


            CreateMap<JobApplicationCreateDTO, JobApplication>();

            CreateMap<JobAd, JobAdDisplayDTO>()
            .ForMember(dest => dest.Title, opt => opt.MapFrom(src => src.Job.Title))
            .ForMember(dest => dest.SalaryTypeName, opt => opt.MapFrom(src => src.SalaryType.Name))
            .ForMember(dest => dest.ExperienceName, opt => opt.MapFrom(src => src.Job.Experience.Name))
            .ForMember(dest => dest.SalaryRange, opt => opt.MapFrom(src => $"{src.SalaryMin} - {src.SalaryMax}"))
            .ForMember(dest => dest.DaysLeft, opt => opt.MapFrom(src => (src.EndAt - DateTime.Now).Days))
            .ForMember(dest => dest.SkillNames, opt => opt.MapFrom(src => src.JobSkills.Select(js => js.Skill.Name).ToList()));
        }
    }
}
