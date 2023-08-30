using AutoMapper;
using JobFinder.Application.DTOs.Categories;
using JobFinder.Application.DTOs.Users;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class CategoryProfile : Profile
    {
        public CategoryProfile() {

            CreateMap<Category, CategoryDTO>()
                .ForMember(dest => dest.SubCategories, opt => opt.MapFrom(src => src.Subcategories));
        }
    }
}
