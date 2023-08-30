using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.Application.UseCases.Query.Skills;
using JobFinder.Domain.Entities;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class JobsController : ControllerBase
    {
        private readonly UseCaseHandler _useCaseHandler;
        public JobsController(UseCaseHandler userCaseHandler)
        {
            _useCaseHandler = userCaseHandler;
        }


        /// <summary>
        /// Returns Jobs.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="200">Ok.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search,
                                 [FromServices] IGetJobsQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns a job based on ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Skill with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        
        public IActionResult Get(int id, [FromServices] IFindJobQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new job.
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
        public IActionResult Post([FromBody] JobDTO dto,
                                  [FromServices] ICreateCommand<JobDTO> command)
        {
            _useCaseHandler.HandleCommand(command, dto);
            return Ok(201);
        }
    }
}
