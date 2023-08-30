using AutoMapper;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JobFinder.Application.DTOs;
using JobFinder.Application.Exceptions;
using JobFinder.Application.UseCases;
using JobFinder.Application.DTOs.Users;

namespace JobFinder.Implementation.UseCases.Command.Abstract
{
    public abstract class UpdateCommandBase<TDto, TEntity> : EfUseCase, IUpdateCommand<TDto>
    where TDto : class,IHasId 
    where TEntity : Entity
    {
        private readonly IMapper _mapper;
        private readonly IValidationFactory _factory;
        private readonly IApplicationUser _user;
        protected UpdateCommandBase(JobFinderDBContext context, 
                                    IMapper mapper, 
                                    IValidationFactory factory,
                                    IApplicationUser user)
            : base(context)
        {
            _mapper = mapper;
            _factory = factory;
            _user = user;
        }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public abstract string Description { get; }

        public void Execute(TDto request)
        {
            var loginiD = _user.Id;
            if(request is EmployerUpdateDTO employer)
            {
                if(employer.Id !=  loginiD)
                {
                    throw new ForbiddenAccessException("You are not allowed to update this user.");
                }
            }
            _factory.GetValidator<TDto>().Validate(request);
            Update<TEntity>(request);
        }

        public void Update<TEntity>(TDto request) where TEntity : Entity
        {

            TEntity existingEntity = Context.Set<TEntity>().Find(request.Id);
            if (existingEntity == null)
            {
                throw new EntityNotFoundException($"Entity with ID {request.Id} not found.");
            }

            _mapper.Map(request, existingEntity);
            Context.SaveChanges();
        }

    }
}
