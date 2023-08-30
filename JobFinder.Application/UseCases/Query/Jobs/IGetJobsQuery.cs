using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Search;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query.Jobs
{
    public interface IGetJobsQuery : IQuery<BaseSearch,IEnumerable<JobDisplayDTO>>
    {
    }
}
