using AutoMapper;
using FluentValidation;
using JobFinder.Application;
using JobFinder.Application.UseCases.Command;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;


namespace JobFinder.Implementation.UseCases.Command.Abstract
{
    public abstract class CreateCommandBase<TDto, TEntity> : EfUseCase, ICreateCommand<TDto>
    where TDto : class
    where TEntity : class
    {
        private readonly IMapper _mapper;
        private readonly IValidationFactory _factory;

        protected CreateCommandBase(JobFinderDBContext context, IMapper mapper, IValidationFactory factory)
            : base(context)
        {
            _mapper = mapper;
            _factory = factory;
        }

        public abstract int Id { get; }
        public abstract string Name { get; }
        public abstract string Description { get; }

        public void Execute(TDto request)
        {
            _factory.GetValidator<TDto>().ValidateAndThrow(request);

            TEntity newEntity = _mapper.Map<TEntity>(request);

            Context.Set<TEntity>().Add(newEntity);
            Context.SaveChanges();
        }
        
    }
}
