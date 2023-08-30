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
    public class SkillConfiguration : EntityConfiguration<Skill>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<Skill> builder)
        {
            builder.Property(x => x.Name).IsRequired(true).HasMaxLength(150);
            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.JobSkills)
                   .WithOne(x => x.Skill)
                   .HasForeignKey(x => x.SkillId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
