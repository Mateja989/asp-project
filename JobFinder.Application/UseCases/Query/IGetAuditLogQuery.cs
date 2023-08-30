using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query
{
    public interface IGetAuditLogQuery : IQuery<AuditLogSearchDTO,PagedResponse<AuditLogDTO>>
    {

    }
}
