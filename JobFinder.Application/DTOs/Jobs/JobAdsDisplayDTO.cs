using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Jobs
{
    public class JobAdDisplayDTO
    {
        public string Title { get; set; }
        public List<string> SkillNames { get; set; } = new List<string>();
        public string SalaryTypeName { get; set; }
        public string ExperienceName { get; set; }
        public int DaysLeft { get; set; }
        public string SalaryRange { get; set; }
    }









}
