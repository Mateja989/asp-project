using AutoMapper;
using JobFinder.Application.Constant;
using JobFinder.Application.DTOs.Users;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Mappings
{
    public class UseCaseResolver : IValueResolver<UserDTO, object, IEnumerable<int>>
    {
        public IEnumerable<int> Resolve(UserDTO source, object destination, IEnumerable<int> destMember, ResolutionContext context)
        {
            if (destination is Employer)
            {
                return UserUseCaseConstants.EmployerUserUseCaseIds; 
            }
            else if (destination is Candidate)
            {
                return UserUseCaseConstants.CandidateUserUseCaseIds; 
            }

            return Enumerable.Empty<int>(); // Ako nije ni Employer ni Candidate
        }
    }
}
