using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Skills;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.Domain.Entities;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Reflection.Metadata;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class SkillsController : ControllerBase
    {
        private readonly UseCaseHandler _useCaseHandler;

        public SkillsController(UseCaseHandler useCaseHandler)
        {
            _useCaseHandler = useCaseHandler;
        }


        /// <summary>
        /// Returns products.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="200">Ok.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery]BasePagedSearch search,
                                 [FromServices] IGetSkillsQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query,search));
        }

        /// <summary>
        /// Returns a skill based on ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Skill with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        [AllowAnonymous]
        public IActionResult Get(int id, [FromServices] IFindSkillQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new skill.
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull creation.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] SkillDTO dto,
                                  [FromServices] ICreateCommand<SkillDTO> command)
        {
            _useCaseHandler.HandleCommand(command, dto);
            return StatusCode(201);
        }


        /// <summary>
        /// Delete Skills.
        /// </summary>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
                                    [FromServices] IDeleteCommand<DeleteDTO<Skill>> command)
        {
            DeleteDTO<Skill> dto = new()
            {
                Id = id
            };
            _useCaseHandler.HandleCommand(command, dto);
            return StatusCode(204);
        }
    }
}
