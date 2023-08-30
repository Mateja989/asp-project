using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query
{
    public class EfGetAuditLogQuery : EfUseCase, IGetAuditLogQuery
    {
        private readonly IMapper _mapper;   
        public EfGetAuditLogQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 38;

        public string Name => "Get Audit Log information";

        public string Description => "Get Audit log information using EF.";

        public PagedResponse<AuditLogDTO> Execute(AuditLogSearchDTO request)
        {
            IQueryable<AuditLog> query = Context.AuditLogs;

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Identity.Contains(request.Keyword) || x.UseCaseName.Contains(request.Keyword));
            }

            if (request.DateStart != null)
            {
                query = query.Where(x => x.ExecutionDateTime >= request.DateStart);
            }

            if (request.DateEnd != null)
            {
                query = query.Where(x => x.ExecutionDateTime <= request.DateEnd);
            }

            if (request.PerPage == null || request.PerPage < 1)
            {
                request.PerPage = 15;
            }

            if (request.Page == null || request.Page < 1)
            {
                request.Page = 15;
            }

            var toSkip = (request.Page.Value - 1) * request.PerPage.Value;

            var response = new PagedResponse<AuditLogDTO>();

            response.TotalCount = query.Count();

            response.Data = query.Skip(toSkip)
                                 .Take(request.PerPage.Value)
                                 .Select(query => _mapper.Map<AuditLogDTO>(query))
                                 .ToList();

            response.CurrentPage = request.Page.Value;

            response.ItemsPerPage = request.PerPage.Value;

            return response;
        }
    }
}
