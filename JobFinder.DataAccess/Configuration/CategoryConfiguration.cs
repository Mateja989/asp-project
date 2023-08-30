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
    public class CategoryConfiguration : EntityConfiguration<Category>
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<Category> builder)
        {
            builder.Property(x => x.Name).IsRequired(true).HasMaxLength(100);

            builder.HasIndex(x => x.Name).IsUnique();

            builder
                .HasMany(x => x.Subcategories)
                .WithOne(x => x.Parent)
                .HasForeignKey(x => x.ParentId)
                .OnDelete(DeleteBehavior.Restrict);

            builder
                .HasMany(x => x.Jobs)
                .WithOne(x => x.Category)
                .HasForeignKey(x => x.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
