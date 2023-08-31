using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Users;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class CandidateProfile : Profile
    {
        public CandidateProfile()
        {
            CreateMap<CandidateCreateDTO, Candidate>()
                .ForMember(dest => dest.Password, opt => opt.ConvertUsing(new PasswordToHashConverter())); 

            CreateMap<Candidate, CandidateCreateDTO>();

            CreateMap<CandidateUpdateDTO, Candidate>()
               .ForMember(dest => dest.Password, opt => opt.ConvertUsing(new PasswordToHashConverter()))
               .ForMember(dest => dest.Id, opt => opt.Ignore()) 
               .ForMember(dest => dest.Degree, opt => opt.MapFrom(src => src.Degree))
               .ForMember(dest => dest.Phone, opt => opt.MapFrom(src => src.Phone))
               .ForMember(dest => dest.CV, opt => opt.MapFrom(src => src.CV))
               .ForMember(dest => dest.PersonalWebsite, opt => opt.MapFrom(src => src.PersonalWebsite))
               .ForMember(dest => dest.LinkedInProfile, opt => opt.MapFrom(src => src.LinkedInProfile));

            
        }
       
    }
}
