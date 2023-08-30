using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Jobs;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class JobAdsController : ControllerBase
    {
        private readonly UseCaseHandler _useCaseHandler;
        public JobAdsController(UseCaseHandler useCaseHandler)
        {
            _useCaseHandler = useCaseHandler;
        }
        /// <summary>
        /// Returns Jobs ads.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="200">Ok.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] JobAdSearch search,
                                 [FromServices] IGetJobAdsQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns a jobAd based on ID.
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
        public IActionResult Get(int id, [FromServices] IFindJobAdQuery query)
        {
            return Ok(_useCaseHandler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a job ad.
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
        public IActionResult Post([FromBody] JobAdCreateDTO dto,
                         [FromServices] ICreateCommand<JobAdCreateDTO> command)
        {
            _useCaseHandler.HandleCommand(command, dto);
            return Ok(201);
        }

       
    }
}
