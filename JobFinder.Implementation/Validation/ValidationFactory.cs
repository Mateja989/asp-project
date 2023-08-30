using FluentValidation;
using JobFinder.Application;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.Validation
{
    public class ValidationFactory : IValidationFactory
    {
        private readonly IServiceProvider _serviceProvider;

        public ValidationFactory(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public IValidator<TDto> GetValidator<TDto>()
        {
            return _serviceProvider.GetService<IValidator<TDto>>();
        }
    }
}
