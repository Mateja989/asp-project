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
    public class SalaryTypeConfiguration : EntityConfiguration<SalaryType>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<SalaryType> builder)
        {
            builder.Property(x => x.Name).IsRequired(true).HasMaxLength(150);
            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.Jobs)
                   .WithOne(x => x.SalaryType)
                   .HasForeignKey(x => x.SalaryTypeId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
