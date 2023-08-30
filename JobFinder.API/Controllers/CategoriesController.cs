using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Categories;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.DataAccess;
using JobFinder.Domain.Entities;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CategoriesController : ControllerBase
    {
        private readonly UseCaseHandler _handler;
        public CategoriesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns category.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BasePagedSearch search,
                                 [FromServices] IGetCategoryQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Delete category.
        /// </summary>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
                                    [FromServices] IDeleteCommand<DeleteDTO<Category>> command)
        {
            DeleteDTO<Category> dto = new()
            {
                Id = id
            };
            _handler.HandleCommand(command, dto);
            return StatusCode(204);
        }
    }
}
