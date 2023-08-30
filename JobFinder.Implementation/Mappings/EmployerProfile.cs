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
    public class EmployerProfile : Profile
    {
        public EmployerProfile() {

            CreateMap<EmployerDto, Employer>()
            .ForMember(dest => dest.Password, opt => opt.ConvertUsing(new PasswordToHashConverter()));

            CreateMap<Employer, EmployerDto>();

            CreateMap<EmployerUpdateDTO, Employer>()
                .ForMember(dest => dest.Password, opt => opt.ConvertUsing(new PasswordToHashConverter()))
               .ForMember(dest => dest.Id, opt => opt.Ignore())
               .ForMember(dest => dest.Company, opt => opt.MapFrom(src => src.Company))
               .ForMember(dest => dest.Adress, opt => opt.MapFrom(src => src.Adress))
               .ForMember(dest => dest.City, opt => opt.MapFrom(src => src.City))
               .ForMember(dest => dest.Country, opt => opt.MapFrom(src => src.Country))
               .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description));

        }
    }
}
