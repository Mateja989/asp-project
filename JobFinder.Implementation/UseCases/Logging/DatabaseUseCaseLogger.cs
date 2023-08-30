using JobFinder.Application.UseCases.Logging;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private JobFinderDBContext _context;

        public DatabaseUseCaseLogger(JobFinderDBContext context)
        {
            _context = context;
        }

        public void Log(UseCaseLog log)
        {
            _context.AuditLogs.Add(new AuditLog
            {
                UserId = log.UserId,
                Identity = log.Identity,
                IsAuthorized = log.IsAuthorized,
                Data = log.Data,
                UseCaseName = log.UseCaseName,
                ExecutionDateTime = log.ExecutionDateTime
            });

            _context.SaveChanges();
        }
    }
}
