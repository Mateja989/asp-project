using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Users
{
    public class EmployerUpdateDTO : EmployerDto, IHasId
    {
        public int Id { get; set; }
    }
}
