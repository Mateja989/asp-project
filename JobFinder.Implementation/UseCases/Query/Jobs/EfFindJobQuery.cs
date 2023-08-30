using AutoMapper;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Query.Jobs
{
    public class EfFindJobQuery : EfUseCase, IFindJobQuery
    {
        private readonly IMapper _mapper;
        public EfFindJobQuery(JobFinderDBContext context,IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 14;

        public string Name => "See jobs` details for authorized user.";

        public string Description => "See jobs` details for authorized user using Ef.";

        public JobDisplayDTO Execute(int request)
        {
            var skillEntity = Context.Jobs
                                     .Include(job => job.Experience)
                                     .Include(job => job.Category)
                                     .FirstOrDefault(c => c.Id == request);

            if (skillEntity == null)
            {
                //return NotFound("Candidate not found.");
            }


            return _mapper.Map<JobDisplayDTO>(skillEntity);
        }
    }
}
