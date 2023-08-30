using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class JobApplication 
    {
        public int JobAdId { get; set; }
        public int CandidateId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Candidate Candidate { get; set; }
        public JobAd  JobAd { get; set; }
    }
}
