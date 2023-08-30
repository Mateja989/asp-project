using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class Experience : Entity
    {
        public string Name { get; set; }
        public ICollection<Job> Jobs { get; set; } = new List<Job>();
    }
}
