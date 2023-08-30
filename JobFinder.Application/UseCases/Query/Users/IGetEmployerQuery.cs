using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query.Users
{
    public interface IGetEmployerQuery : IQuery<BaseSearch,IEnumerable<EmployerDto>>
    {
    }
}
