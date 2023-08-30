using JobFinder.Application.DTOs.Jobs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query.Jobs
{
    public interface IFindJobQuery : IQuery<int,JobDisplayDTO>
    {
    }
}
