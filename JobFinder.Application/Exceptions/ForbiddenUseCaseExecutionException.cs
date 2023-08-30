using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.Exceptions
{
    public class ForbiddenUseCaseExecutionException : Exception
    {
        public ForbiddenUseCaseExecutionException(string useCaseName, string identity) :
            base($"User {identity} has tried to execute {useCaseName} without authorization.")
        {

        }
    }
}
