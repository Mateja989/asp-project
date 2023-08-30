using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Jobs
{
    public class JobDTO
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public int ExperienceId { get; set; }
        public int EmployerId { get; set; }
        public int CategoryId { get; set; }
    }
}
