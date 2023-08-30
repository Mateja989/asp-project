using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class JobType : Entity
    {
        public string Name { get; set; }
        public ICollection<JobAd> Jobs { get; set; } = new List<JobAd>();
    }
}
