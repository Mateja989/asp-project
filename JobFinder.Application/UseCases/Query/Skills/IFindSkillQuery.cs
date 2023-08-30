using JobFinder.Application.DTOs.Skills;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query.Skills
{
    public interface IFindSkillQuery : IQuery<int,SkillDTO>
    {

    }
}
