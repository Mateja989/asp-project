using AutoMapper;
using JobFinder.Application.DTOs;
using JobFinder.Application.UseCases.Command;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobFinder.Implementation.UseCases.Command.Abstract
{
    public abstract class DeleteCommandBase<TDto,TEntity> : EfUseCase,IDeleteCommand<TDto>
        where TEntity : Entity
        where TDto : DeleteDTO<TEntity>
    {
        protected DeleteCommandBase(JobFinderDBContext context) : base(context)
        {
        }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public abstract string Description { get; }

        public void Execute(TDto request)
        {
            TEntity existingEntity = Context.Set<TEntity>().Find(request.Id);
            if (existingEntity == null)
            {
                // Handle entity not found
                throw new NullReferenceException();
            }

            Context.Set<TEntity>().Remove(existingEntity);
            Context.SaveChanges();
        }
    }
}
