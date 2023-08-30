using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class Job : Entity
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public int ExperienceId { get; set; }
        public int EmployerId { get; set; }
        public int CategoryId { get; set; }
        public Experience Experience { get; set; }
        public Employer Employer { get; set; }
        public Category Category { get; set; }
        public ICollection<JobAd> JobAds { get; set; } = new List<JobAd>();

    }
}
