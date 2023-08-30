using JobFinder.Application.DTOs;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Application.UseCases.Command
{
    public interface IDeleteCommand<TDto> : ICommand<TDto>
    {
        
    }
}
