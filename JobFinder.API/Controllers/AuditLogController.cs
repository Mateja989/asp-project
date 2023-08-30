using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.UseCases.Query;
using JobFinder.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
     [Route("api/[controller]")]
     [ApiController]
     [Authorize]
     public class AuditLogController : ControllerBase
     {

        private readonly UseCaseHandler _useCaseHandler;

        public AuditLogController(UseCaseHandler useCaseHandler)
        {
            _useCaseHandler = useCaseHandler;
        }
        /// <summary>
        /// Returns audit log.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="200">Ok.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
         public IActionResult Get([FromQuery] AuditLogSearchDTO search,
                                  [FromServices] IGetAuditLogQuery query)
         {
             return Ok(_useCaseHandler.HandleQuery(query,search));
         } 
     }
}
