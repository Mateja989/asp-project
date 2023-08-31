using JobFinder.Application.Constant;
using JobFinder.Application.DTOs.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JobFinder.Domain.Entities;

namespace JobFinder.Application.DTOs
{
    public class CandidateDTO : UserDTO
    {
        public string Degree { get; set; }
        public string Phone { get; set; }
        public string CV { get; set; }
        public string PersonalWebsite { get; set; }
        public string LinkedInProfile { get; set; }
    }
    public class CandidateCreateDTO : CandidateDTO
    {
        public List<UserUseCase> UseCases { get;  } = UserUseCaseConstants.CandidateUserUseCaseIds.Select(useCaseId => new UserUseCase
        {
            UseCaseId = useCaseId
        }).ToList();
    }

    public class CandidateUpdateDTO : CandidateDTO,IHasId 
    {
        public int Id { get; set; }
    }

   



}
