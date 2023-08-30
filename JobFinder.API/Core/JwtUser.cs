using JobFinder.Application.Constant;
using JobFinder.Domain.Entities;
using System.Collections.Generic;

namespace JobFinder.API.Core
{
    public class JwtUser : IApplicationUser
    {
        public string Identity { get; set; }
        public int Id { get; set; }
        public IEnumerable<int> UseCaseIds { get; set; } = new List<int>();
        public string Email { get; set; }
    }
    public class AnonimousUser : IApplicationUser
    {
        public string Identity => "Anonymous";
        public int Id => 0;
        public string Email => "anonimous@jobfinder.com";
        public IEnumerable<int> UseCaseIds => UserUseCaseConstants.AnonimousUserUseCaseIds;

    }
}
