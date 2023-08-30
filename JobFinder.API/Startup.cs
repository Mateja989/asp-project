using JobFinder.API.Core;
using JobFinder.API.Extensions;
using JobFinder.Application;
using JobFinder.Application.Logging;
using JobFinder.Application.UseCases;
using JobFinder.Application.UseCases.Logging;
using JobFinder.Implementation;
using JobFinder.Implementation.Logging;
using JobFinder.Implementation.UseCases;
using JobFinder.Implementation.UseCases.Logging;
using JobFinder.Implementation.Validation;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace JobFinder.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var settings = new AppSettings();

            Configuration.Bind(settings);

            services.AddSingleton(settings);
            services.AddHttpContextAccessor();
            services.AddApplicationUser();
            services.AddJwt(settings);
            services.AddJobFinderDBContext();
            services.AddSingleton<IValidationFactory, ValidationFactory>();
            services.AddAutoMapper();
            services.AddUseCases();
            services.AddValidators();
            services.AddTransient<IExceptionLogger, ConsoleExceptionLogger>();
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddTransient<UseCaseHandler>();
            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "JobFinder.API", Version = "v1" });
                var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));

            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "JobFinder.API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
