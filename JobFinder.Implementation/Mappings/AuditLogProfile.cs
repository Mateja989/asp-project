using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class AuditLogProfile : Profile
    {
        public AuditLogProfile() { 

            CreateMap<AuditLog, AuditLogDTO>();

        }
    }
}
