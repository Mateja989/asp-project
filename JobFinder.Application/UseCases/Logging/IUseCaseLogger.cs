using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Logging
{
    public interface IUseCaseLogger
    {
        void Log(UseCaseLog log);
    }


}
