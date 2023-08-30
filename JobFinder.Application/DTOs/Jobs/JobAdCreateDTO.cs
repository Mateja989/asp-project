using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Jobs
{
    public class JobAdCreateDTO
    {
        public decimal SalaryMin { get; set; }
        public decimal SalaryMax { get; set; }
        public int JobTypeId { get; set; }
        public int SalaryTypeId { get; set; }
        public int JobId { get; set; }
        public DateTime EndAt { get; set; }
        public List<int> JobSkillIds { get; set; } = new List<int>();


    }

}
