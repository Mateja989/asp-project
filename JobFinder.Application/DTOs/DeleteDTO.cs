using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs
{
    public class DeleteDTO<TEntity>
        where TEntity : Entity
    {
        public int Id { get; set; }
    }
}
