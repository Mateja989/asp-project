using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Search
{
    public class AuditLogSearchDTO : BasePagedSearch
    {
        public string Identity { get; set; }
        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }
    }
}
