using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JobFinder.Domain;
using JobFinder.Domain.Entities;

namespace JobFinder.Application.DTOs
{
    public class InitialDataDTO
    {
        public IEnumerable<Skill> Skills { get; set; }
        public IEnumerable<Category> Categories { get; set; }
        public IEnumerable<JobType> JobTypes { get; set; }
        public IEnumerable<Experience> Experiences { get; set; }
        public Admin Admin { get; set; }
        public Employer Employer { get; set; }
        public Candidate Candidate { get; set; }
        public UserUseCase UserUseCase { get; set; }
    }
}
