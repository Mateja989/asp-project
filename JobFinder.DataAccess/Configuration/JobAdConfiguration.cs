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
    public class JobAdConfiguration : EntityConfiguration<JobAd>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<JobAd> builder)
        {
            builder.Property(x => x.SalaryMin).IsRequired(true);
            builder.Property(x => x.SalaryMax).IsRequired(true);

            builder.Property(x => x.EndAt)
                   .HasDefaultValueSql("DATEADD(day, 30, GETDATE())");

            builder.HasMany(x => x.JobSkills)
                   .WithOne(x => x.JobAd)
                   .HasForeignKey(x => x.JobAdId)
                   .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.JobApplications)
                   .WithOne(x => x.JobAd)
                   .HasForeignKey(x => x.JobAdId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
