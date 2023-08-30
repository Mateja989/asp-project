using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Users;
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
    public class EmployersController : ControllerBase
    {
        private UseCaseHandler _handler;
        public EmployersController(UseCaseHandler handler)
        {
            _handler = handler;
        }
       
        /// <summary>
        /// Returns employers.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BaseSearch search,
                                 [FromServices] IGetEmployerQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Creates a new employer.
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
        [AllowAnonymous]
        public IActionResult Post([FromBody] EmployerDto dto,
                                  [FromServices] ICreateCommand<EmployerDto> command)
        {
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        /// <summary>
        /// Updates a employer with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dto"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull update.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}")]
        
        public IActionResult Put(int id,
                                 [FromBody]EmployerUpdateDTO dto,
                                 [FromServices] IUpdateCommand<EmployerUpdateDTO> command)
        {
            dto.Id = id;
            _handler.HandleCommand(command, dto);
            return StatusCode(204);
        }

        
    }
}
