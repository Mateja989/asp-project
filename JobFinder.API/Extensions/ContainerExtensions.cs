using JobFinder.API.Core;
using JobFinder.DataAccess;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System;
using JobFinder.Domain.Entities;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using Newtonsoft.Json;
using JobFinder.Application.UseCases.Command;
using AutoMapper;
using JobFinder.Implementation.Mappings;
using JobFinder.Application.DTOs;
using FluentValidation;
using JobFinder.Application.DTOs.Users;
using JobFinder.Implementation.UseCases.Command.Users;
using JobFinder.Implementation.Validation.Users;
using JobFinder.Implementation.UseCases.Command.Skills;
using JobFinder.Implementation.Validation.Skills;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.Implementation.UseCases.Query.Users;
using JobFinder.Application.UseCases.Query.Skills;
using JobFinder.Implementation.UseCases.Query.Skills;
using JobFinder.Application.DTOs.Jobs;
using JobFinder.Implementation.UseCases.Command.Jobs;
using JobFinder.Implementation.Validation.Jobs;
using JobFinder.Implementation.UseCases.Command;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.Implementation.UseCases.Query.Jobs;
using JobFinder.Implementation.UseCases.Command.Categories;
using JobFinder.Application.UseCases.Query.Categories;
using JobFinder.Implementation.UseCases.Query.Categories;
using JobFinder.Application.UseCases.Query;
using JobFinder.Implementation.UseCases.Query;

namespace JobFinder.API.Extensions
{
    public static class ContainerExtensions
    {
       public static void AddJobFinderDBContext(this IServiceCollection services)
       {
            services.AddTransient(x =>
            {
                var optionsBuilder = new DbContextOptionsBuilder();

                var conString = x.GetService<AppSettings>().ConnString;

                optionsBuilder.UseSqlServer(conString);

                var options = optionsBuilder.Options;

                var actor = x.GetService<IApplicationUser>();

                return new JobFinderDBContext(options,actor);
            });
        }

        public static void AddJwt(this IServiceCollection services, AppSettings settings)
        {
            services.AddTransient(x =>
            {
                var context = x.GetService<JobFinderDBContext>();
                var settings = x.GetService<AppSettings>();

                return new JwtManager(context, settings.JwtSettings);
            });


            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = settings.JwtSettings.Issuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(settings.JwtSettings.SecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

       
        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<ICreateInitialDataCommand, CreateInitialDataCommand>();
            services.AddScoped<IGetAuditLogQuery, EfGetAuditLogQuery>();

            // All Users
            services.AddScoped<IDeleteCommand<DeleteDTO<User>>, EfDeleteUserCommand>();
            services.AddScoped<IGetCandidatesQuery, EfGetCandidatesQuery>();
            services.AddScoped<IFindCandidateQuery,EfFindCandidateQuery>();
            services.AddScoped<ICreateCommand<CandidateCreateDTO>, EfCreateCandidateCommand>();
            services.AddScoped<IUpdateCommand<CandidateUpdateDTO>, EfUpdateCandidateCommand>();
            services.AddScoped<IGetEmployerQuery, EfGetEmployersQuery>();
            services.AddScoped<ICreateCommand<EmployerDto>, EfCreateEmployerCommand>();
            services.AddScoped<IUpdateCommand<EmployerUpdateDTO>, EfUpdateEmployerCommand>();

            // Skill 
            services.AddScoped<ICreateCommand<SkillDTO>,EfCreateSkillCommand>();
            services.AddScoped<IGetSkillsQuery, EFGetSkillsQuery>();
            services.AddScoped<IFindSkillQuery, EfFindSkillQuery>();
            services.AddScoped<IDeleteCommand<DeleteDTO<Skill>>, EfDeleteSkillCommand>();

            // Category
            services.AddScoped<IGetCategoryQuery, EfGetCategoryQuery>();
            services.AddScoped<IDeleteCommand<DeleteDTO<Category>>, EfDeleteCategoryCommand>();

            // Jobs
            services.AddScoped<ICreateCommand<JobDTO>,EfCreateJobCommand>();
            services.AddScoped<ICreateCommand<JobAdCreateDTO>, EfCreateJobAdCommand>();
            services.AddScoped<ICreateCommand<JobApplicationCreateDTO>, EfCreateJobApplicationCommand>();
            services.AddScoped<IGetJobsQuery,EfGetJobsQuery>();
            services.AddScoped<IFindJobQuery, EfFindJobQuery>();
            services.AddScoped<IGetJobAdsQuery, EfGetJobAdsQuery>();
            services.AddScoped<IFindJobAdQuery, EfFindJobAdQuerycs>();
            //izmeni posao
        }

        

        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<IValidator<CandidateCreateDTO>, CandidateCreateValidation>();
            services.AddTransient<IValidator<CandidateUpdateDTO>, CandidateUpdateValidator>();
            services.AddTransient<IValidator<EmployerDto>,EmployerCreateValidator>();
            services.AddTransient<IValidator<SkillDTO>,CreateSkillValidator>();
            services.AddTransient<IValidator<JobDTO>,CreateJobValidator>();
            services.AddTransient<IValidator<JobAdCreateDTO>,CreateJobAdValidator>();
            services.AddTransient<IValidator<JobApplicationCreateDTO>, CreateJobApplicationValidator>();
            services.AddTransient<IValidator<EmployerUpdateDTO>, EmployerUpdateValidator>();
        }

        public static void AddAutoMapper(this IServiceCollection services)
        {

            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new CandidateProfile());
                mc.AddProfile(new EmployerProfile());
                mc.AddProfile(new SkillProfile());
                mc.AddProfile(new JobProfile());
                mc.AddProfile(new CategoryProfile());
                mc.AddProfile(new AuditLogProfile());
            });

            IMapper mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);
        }

        public static void AddApplicationUser(this IServiceCollection services)
        {
            services.AddTransient<IApplicationUser>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var header = accessor.HttpContext.Request.Headers["Authorization"]; 

                var claims = accessor.HttpContext.User;

                if (claims == null || claims.FindFirst("UserId") == null)
                {
                    return new AnonimousUser();
                }

                var actor = new JwtUser
                {
                    Email = claims.FindFirst("Email").Value,
                    Id = Int32.Parse(claims.FindFirst("UserId").Value),
                    Identity = claims.FindFirst("Email").Value,
                    UseCaseIds = JsonConvert.DeserializeObject<List<int>>(claims.FindFirst("UseCases").Value),
                };

                return actor;
            });
        }
    }


}
