using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class Skill : Entity,ISoftDeletable
    {
        public string Name { get; set; }
        public ICollection<JobSkill> JobSkills { get; set; } = new List<JobSkill>();
        public DateTime? DeletedAt { get; set; }
    }
}
