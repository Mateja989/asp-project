using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class JobSkill
    {
        public int JobAdId { get; set; }
        public int SkillId { get; set; }
        public JobAd JobAd { get; set; }
        public Skill Skill { get; set; }
    }
}
