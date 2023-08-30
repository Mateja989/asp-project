﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.DTOs.Categories
{
    public class CategoryDTO 
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<CategoryDTO> SubCategories { get; set; }
    }
}
