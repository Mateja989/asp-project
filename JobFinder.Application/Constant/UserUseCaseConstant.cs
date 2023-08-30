using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.Constant
{
    public static class UserUseCaseConstants
    {
        public static List<int> AnonimousUserUseCaseIds => new List<int> { 1, 5, 31, 10, 4, 3, 7, 35, 30, 36 };
        public static List<int> CandidateUserUseCaseIds => new List<int> { 2, 22, 31, 11, 10, 4, 3, 7, 35, 36};
        public static List<int> EmployerUserUseCaseIds => new List<int> { 6, 21, 13, 31, 14, 15, 11, 10, 4, 3, 7, 35, 36 };
        public static List<int> AdminUserUseCaseIds => new List<int> { 27, 9, 25, 12, 30, 31, 10, 4, 3, 7, 35, 36 };
    }
}
