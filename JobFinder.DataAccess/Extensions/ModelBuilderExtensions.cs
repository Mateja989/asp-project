using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.DataAccess.Extensions
{
    public static class ModelBuilderExtensions 
    {
        public static void ApplyCustomConfiguration(this ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(JobFinderDBContext).Assembly);
            modelBuilder.Entity<UserUseCase>().HasKey(x => new { x.UserId, x.UseCaseId });
            modelBuilder.Entity<UserUseCase>().HasOne(x => x.User).WithMany(x => x.UseCases).HasForeignKey(x => x.UserId);
            modelBuilder.Entity<JobApplication>().HasKey(x => new { x.JobAdId, x.CandidateId });
            modelBuilder.Entity<JobApplication>().Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");
            modelBuilder.Entity<JobSkill>().HasKey(x => new { x.JobAdId, x.SkillId });
            modelBuilder.Entity<User>()
                .HasDiscriminator<string>("Discriminator")
                .HasValue<Candidate>("Candidate")
                .HasValue<Employer>("Employer")
                .HasValue<Admin>("Admin");
        }
    }
}
