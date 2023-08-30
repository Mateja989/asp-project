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
    public class JobConfiguration : EntityConfiguration<Job>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<Job> builder)
        {

            builder.Property(x => x.Title).IsRequired(true).HasMaxLength(200);
            builder.Property(x => x.Description).IsRequired(true).HasColumnType("TEXT");

            builder.HasMany(x => x.JobAds)
                   .WithOne(x => x.Job)
                   .HasForeignKey(x => x.JobId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
