using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.DataAccess.Configuration
{
    public class CandidateConfiguration : UserConfiguration<Candidate>
    {
        protected override void ConfigureRelation(EntityTypeBuilder<Candidate> builder)
        {
            builder.HasMany(x => x.JobApplications)
                   .WithOne(x => x.Candidate)
                   .HasForeignKey(x => x.CandidateId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
