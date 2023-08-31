using JobFinder.Application.Constant;
using JobFinder.Application.DTOs;
using JobFinder.Application.UseCases.Command;
using JobFinder.Domain.Entities;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InitialDataController : ControllerBase
    {
        private UseCaseHandler _handler;
        public InitialDataController(UseCaseHandler handler)
        {
            _handler = handler;
        }
        
        
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromServices] ICreateInitialDataCommand command)
        {
            var data = new InitialDataDTO();

            data.Categories = new List<Category>
            {
                new Category
                {
                    Name = "Development",
                    Subcategories = new List<Category>
                    {
                        new Category { Name = "Front-end Development" },
                        new Category { Name = "Back-end Development" },
                        new Category { Name = "Full-stack Development" },
                        new Category { Name = "Mobile App Development" },
                        new Category { Name = "Game Development" }
                    }
                },
                new Category
                {
                    Name = "Design",
                    Subcategories = new List<Category>
                    {
                        new Category { Name = "UI/UX Design" },
                        new Category { Name = "Graphic Design" },
                        new Category { Name = "Web Design" },
                        new Category { Name = "Interaction Design" },
                        new Category { Name = "Motion Design" }
                    }
                },
                new Category
                {
                    Name = "Data & Analytics",
                    Subcategories = new List<Category>
                    {
                        new Category { Name = "Data Science" },
                        new Category { Name = "Business Intelligence" },
                        new Category { Name = "Machine Learning" },
                        new Category { Name = "Data Engineering" },
                        new Category { Name = "Data Analysis" }
                    }
                },
                new Category
                {
                    Name = "Cybersecurity",
                    Subcategories = new List<Category>
                    {
                        new Category { Name = "Network Security" },
                        new Category { Name = "Application Security" },
                        new Category { Name = "Information Security" },
                        new Category { Name = "Penetration Testing" },
                        new Category { Name = "Security Auditing" }
                    }
                },
                new Category
                {
                    Name = "Project Management",
                    Subcategories = new List<Category>
                    {
                        new Category { Name = "Agile Project Management" },
                        new Category { Name = "Scrum Master" },
                        new Category { Name = "Product Owner" },
                        new Category { Name = "IT Project Manager" },
                        new Category { Name = "Program Manager" }
                    }
                }
            };
            data.Skills = new List<Skill>
            {
                // Programski jezici
                new Skill { Name = "JavaScript" },
                new Skill { Name = "Python" },
                new Skill { Name = "Java" },
                new Skill { Name = "C#" },
                new Skill { Name = "Ruby" },
                new Skill { Name = "PHP" },
                new Skill { Name = "Swift" },
                new Skill { Name = "Go" },
                new Skill { Name = "Rust" },
                new Skill { Name = "Kotlin" },
    
                // Git i Version Control
                new Skill { Name = "Git" },
                new Skill { Name = "SVN" },
                new Skill { Name = "Mercurial" },
    
                // Frameworks
                new Skill { Name = "React" },
                new Skill { Name = "Angular" },
                new Skill { Name = "Vue.js" },
                new Skill { Name = ".NET Core" },
                new Skill { Name = "Ruby on Rails" },
                new Skill { Name = "Django" },
                new Skill { Name = "Spring Boot" },
                new Skill { Name = "Laravel" },
                new Skill { Name = "Flask" },
                new Skill { Name = "Express.js" },
    
                // Baze podataka
                new Skill { Name = "SQL" },
                new Skill { Name = "MongoDB" },
                new Skill { Name = "PostgreSQL" },
                new Skill { Name = "MySQL" },
                new Skill { Name = "SQLite" },
    
                // Design Tools
                new Skill { Name = "Adobe Photoshop" },
                new Skill { Name = "Adobe Illustrator" },
                new Skill { Name = "Sketch" },
                new Skill { Name = "Figma" },
                new Skill { Name = "InVision" },
    
                // Serveri baza podataka
                new Skill { Name = "Microsoft SQL Server" },
                new Skill { Name = "Oracle Database" },
                new Skill { Name = "MySQL Server" },
                new Skill { Name = "PostgreSQL Server" },
                new Skill { Name = "MongoDB Atlas" },
    
                // Mreže i sistemi
                new Skill { Name = "Linux" },
                new Skill { Name = "Ubuntu" },
                new Skill { Name = "CentOS" },
                new Skill { Name = "Windows Server" },
                new Skill { Name = "Azure" },
                new Skill { Name = "AWS" },
                new Skill { Name = "Google Cloud" },
                new Skill { Name = "Networking Fundamentals" },
                new Skill { Name = "Cisco Networking" },
            };
            data.Experiences = new List<Experience>
            {
                new Experience { Name = "Junior" },
                new Experience { Name = "Mid-Level" },
                new Experience { Name = "Senior" },
            };
            data.JobTypes = new List<JobType>
            {
                new JobType { Name = "Onsite" },
                new JobType { Name = "Hybrid" },
                new JobType { Name = "Remote" },
            };
            data.Admin = new Admin
            {
                FirstName = "Mateja",
                LastName = "Mastelica",
                Username = "admin123",
                Email = "admin@gmail.com",
                Password = BCrypt.Net.BCrypt.HashPassword("NekaLozinka"),
                UseCases = UserUseCaseConstants.AdminUserUseCaseIds.Select(useCaseId => new UserUseCase
                {
                    UseCaseId = useCaseId
                }).ToList()
            };
            data.Candidate = new Candidate
            {
                FirstName = "John",
                LastName = "Doe",
                Username = "candidate123",
                Email = "candidate@gmail.com",
                Password = BCrypt.Net.BCrypt.HashPassword("CandidatePassword123"),
                Degree = "Bachelor of Science",
                Phone = "555-123-456",
                CV = "Link to CV",
                PersonalWebsite = "johndoe.com",
                LinkedInProfile = "linkedin.com/in/johndoe",
                UseCases = UserUseCaseConstants.CandidateUserUseCaseIds.Select(useCaseId => new UserUseCase
                {
                    UseCaseId = useCaseId
                }).ToList()
            };
            data.Employer = new Employer
            {
                FirstName = "Jane",
                LastName = "Smith",
                Username = "employer123",
                Email = "employer@gmail.com",
                Password = BCrypt.Net.BCrypt.HashPassword("EmployerPassword456"),
                Company = "ABC Corporation",
                Adress = "123 Business Street",
                City = "Metropolis",
                Country = "United Kingdom",
                Description = "We are a leading global company.",
                UseCases = UserUseCaseConstants.EmployerUserUseCaseIds.Select(useCaseId => new UserUseCase
                {
                    UseCaseId = useCaseId
                }).ToList()
            };
            data.SalaryTypes = new List<SalaryType>
            {
                new SalaryType { Name = "Monthly" },
                new SalaryType { Name = "Yearly" },
                new SalaryType { Name = "Daily" },
                new SalaryType { Name = "Hourly" }
            }

            _handler.HandleCommand(command, data);
            return StatusCode(201);

        }
        

    }
}
