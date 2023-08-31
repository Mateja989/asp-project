using JobFinder.Application.DTOs;
using JobFinder.Application.UseCases.Command;
using JobFinder.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command
{
    public class CreateInitialDataCommand : EfUseCase,ICreateInitialDataCommand
    {
        public CreateInitialDataCommand(JobFinderDBContext context) : base(context)
        {
        }

        public int Id => 30;

        public string Name => "Create initial data Command.";

        public string Description => "Inserts initial data into the database using Entity Framework.";

        public void Execute(InitialDataDTO request)
        {

            Context.AddRange(request.Categories);
            Context.AddRange(request.Experiences);
            Context.AddRange(request.Skills);
            Context.AddRange(request.JobTypes);
            Context.AddRange(request.SalaryTypes);
            Context.Add(request.Admin);
            Context.Add(request.Employer);
            Context.Add(request.Candidate);

            Context.SaveChanges();
        }
    }
}
