using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Search
{
    public class JobAdSearch : BaseSearch
    {
        public int? ExperienceId { get; set; }
        public DateTime? EndedAt { get; set; }
        public int? SalaryTypeId { get; set; }
        public List<int> SkillIds { get; set; } = new List<int>();
    }
}
