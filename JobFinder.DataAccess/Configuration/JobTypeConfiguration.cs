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
    public class JobTypeConfiguration : EntityConfiguration<JobType>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<JobType> builder)
        {
            builder.Property(x => x.Name).IsRequired(true).HasMaxLength(150);
            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.Jobs)
                   .WithOne(x => x.JobType)
                   .HasForeignKey(x => x.JobTypeId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
