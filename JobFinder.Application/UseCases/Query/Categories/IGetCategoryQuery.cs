using JobFinder.Application.DTOs.Categories;
using JobFinder.Application.DTOs.Search;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Query.Categories
{
    public interface IGetCategoryQuery : IQuery<BasePagedSearch,PagedResponse<CategoryDTO>>
    {
    }
}
