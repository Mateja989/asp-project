using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.Exceptions
{
    public class ForbiddenAccessException : Exception
    {
        public ForbiddenAccessException() : base("Access forbidden.") { }
        public ForbiddenAccessException(string message) : base(message) { }
        public ForbiddenAccessException(string message, Exception innerException) : base(message, innerException) { }
    }
}
