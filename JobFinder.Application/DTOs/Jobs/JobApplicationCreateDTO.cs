using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Jobs
{
    public class JobApplicationCreateDTO
    {
        public int JobAdId { get; set; }
        public int CandidateId { get; set; }
    }
}
