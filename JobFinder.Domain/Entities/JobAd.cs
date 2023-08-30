using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class JobAd : Entity
    {
        public decimal SalaryMin { get; set; }
        public decimal SalaryMax { get; set; }
        public int JobTypeId { get; set; }
        public int SalaryTypeId { get; set; }
        public int JobId { get; set; }
        public DateTime EndAt { get; set; }
        public JobType JobType { get; set; }
        public Job Job { get; set; }
        public SalaryType SalaryType { get; set; }
        public ICollection<JobSkill> JobSkills { get; set; } = new List<JobSkill>();
        public ICollection<JobApplication> JobApplications { get; set; } = new List<JobApplication>();
    }
}
