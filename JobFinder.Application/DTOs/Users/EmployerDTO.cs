using JobFinder.Application.Constant;
using JobFinder.Application.DTOs.Jobs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Users
{
    public class EmployerDto : UserDTO
    {
        public string Company { get; set; }
        public string Adress { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Description { get; set; }
        public List<UserUseCase> UseCases { get; set; } = UserUseCaseConstants.EmployerUserUseCaseIds.Select(useCaseId => new UserUseCase
        {
            UseCaseId = useCaseId
        }).ToList();
    }

    /*public class SpecificEmployerDTO : EmployerDto
    {
        public int Id { get; set; }

        public List<JobAdDTO> JobAds { get; set; } = new List<JobAdDTO>();
    }*/
}
