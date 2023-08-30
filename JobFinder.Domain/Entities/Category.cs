using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Domain.Entities
{
    public class Category : Entity,ISoftDeletable
    {
        public string Name { get; set; }
        public int? ParentId { get; set; }
        public Category Parent { get; set; }
        public ICollection<Category> Subcategories { get; set; } = new List<Category>();
        public ICollection<Job> Jobs { get; set; } = new List<Job>();
        public DateTime? DeletedAt { get; set; }
    }
}
