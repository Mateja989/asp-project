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
    public class EmployerConfiguration : UserConfiguration<Employer>
    {
        protected override void ConfigureRelation(EntityTypeBuilder<Employer> builder)
        {
            builder.HasMany(x => x.Jobs)
                   .WithOne( x => x.Employer)
                   .HasForeignKey(x => x.EmployerId)
                   .OnDelete(DeleteBehavior.Restrict); 
        }
    }
}
