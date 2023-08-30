using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Jobs
{
    public class JobDisplayDTO
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ExperienceName { get; set; }
        public string EmployerFullName { get; set; }
        public string CategoryName { get; set; }
    }
}
