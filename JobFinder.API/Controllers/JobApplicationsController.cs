using JobFinder.Application.DTOs.Jobs;
using JobFinder.Application.DTOs.Skills;
using JobFinder.Application.UseCases.Command;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class JobApplicationsController : ControllerBase
    {

        private readonly UseCaseHandler _useCaseHandler;

        public JobApplicationsController(UseCaseHandler useCaseHandler)
        {
            _useCaseHandler = useCaseHandler;
        }
        
        /// <summary>
        /// Creates a job application.
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
        public IActionResult Post([FromBody] JobApplicationCreateDTO dto,
                                  [FromServices] ICreateCommand<JobApplicationCreateDTO> command)
        {
            _useCaseHandler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        
    }
}
