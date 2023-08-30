using JobFinder.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases
{
    public abstract class EfUseCase
    {
        protected EfUseCase(JobFinderDBContext context)
        {
            Context = context;
        }

        protected JobFinderDBContext Context { get; }
    }
}
