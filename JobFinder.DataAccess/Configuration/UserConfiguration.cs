using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.DataAccess.Configuration
{
    public abstract class UserConfiguration<TUser> : EntityConfiguration<TUser>
    where TUser : User
    {
        protected override void ConfigureTableSpecifics(EntityTypeBuilder<TUser> builder)
        {
            builder.Property(x => x.FirstName)
                   .IsRequired(true)
                   .HasMaxLength(50);

            builder.Property(x => x.LastName)
                   .IsRequired(true)
                   .HasMaxLength(50);

            builder.Property(x => x.Email)
                   .IsRequired(true);

            builder.Property(x => x.Password)
                   .IsRequired(true)
                   .HasMaxLength(200);

            builder.Property(x => x.Username)
                  .IsRequired(true);

            builder.HasIndex(x => x.Email).IsUnique();
            builder.HasIndex(x => x.Username).IsUnique();

            ConfigureRelation(builder);
        }

        protected abstract void ConfigureRelation(EntityTypeBuilder<TUser> builder);


    }
}
