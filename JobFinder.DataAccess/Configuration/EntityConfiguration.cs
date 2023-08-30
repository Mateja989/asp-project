using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JobFinder.Domain.Entities;

namespace JobFinder.DataAccess.Configuration
{
    public abstract class EntityConfiguration<T> : IEntityTypeConfiguration<T>
       where T : Entity
    {
        
        public void Configure(EntityTypeBuilder<T> builder)
        {
            builder.Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");

            ConfigureTableSpecifics(builder);
        }

        protected abstract void ConfigureTableSpecifics(EntityTypeBuilder<T> builder);
    }
}
