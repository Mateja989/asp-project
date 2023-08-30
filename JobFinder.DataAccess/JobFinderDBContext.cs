using JobFinder.DataAccess.Extensions;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.DataAccess
{
    public class JobFinderDBContext : DbContext
    {
        public IApplicationUser Actor { get; }
        public JobFinderDBContext(DbContextOptions options = null, 
                                  IApplicationUser actor = null) : base(options)
        {
            Actor = actor;
        }

        public override int SaveChanges()
        {
            foreach (var entry in this.ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Deleted:
                            if (entry.Entity is ISoftDeletable sd)
                            {
                                entry.State = EntityState.Modified;
                                sd.DeletedAt = DateTime.UtcNow;
                            }
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyCustomConfiguration();
            base.OnModelCreating(modelBuilder);
        }

        /*protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-7KA8LGK;Initial Catalog=JobFinder;Integrated Security=True");
        }*/

        public DbSet<User> Users { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<JobType> JobTypes { get; set; }
        public DbSet<Experience> Experiences { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<JobApplication> JobApplications { get; set; }
        public DbSet<JobAd> JobAds { get; set; }
        public DbSet<JobSkill> JobSkills { get; set; }
        public DbSet<SalaryType> SalaryTypes { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
    }
}
