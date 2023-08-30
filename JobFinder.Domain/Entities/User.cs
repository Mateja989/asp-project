using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace JobFinder.Domain.Entities
{
    public class User : Entity,ISoftDeletable
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Discriminator { get; set; } 
        public ICollection<UserUseCase> UseCases { get; set; } = new List<UserUseCase>();
        public DateTime? DeletedAt { get ; set; }
    }

    public class Candidate : User
    {
        public string Degree { get; set; }
        public string Phone { get; set; }
        public string CV { get; set; }
        public string PersonalWebsite { get; set; }
        public string LinkedInProfile { get; set; }
        public ICollection<JobApplication> JobApplications { get; set; } = new List<JobApplication>();
    }

    public class Employer : User
    {
        public string Company { get; set; }
        public string Adress { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Description { get; set; }
        public ICollection<Job> Jobs { get; set; } = new List<Job>();
    }

    public class Admin : User
    {

    }
}
