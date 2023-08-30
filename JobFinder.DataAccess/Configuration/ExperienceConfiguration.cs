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
    public class ExperienceConfiguration : EntityConfiguration<Experience>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<Experience> builder)
        {
            builder.Property(x => x.Name).IsRequired(true).HasMaxLength(100);

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.Jobs)
                   .WithOne(x => x.Experience)
                   .HasForeignKey(x => x.ExperienceId)
                   .OnDelete(DeleteBehavior.Restrict); 
        }
    }
}
