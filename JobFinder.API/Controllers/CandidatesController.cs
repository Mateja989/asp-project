using JobFinder.API.DTOs;
using JobFinder.Application.DTOs;
using JobFinder.Application.DTOs.Search;
using JobFinder.Application.DTOs.Users;
using JobFinder.Application.UseCases.Command;
using JobFinder.Application.UseCases.Query.Users;
using JobFinder.Implementation;
using JobFinder.Implementation.UseCases.Query;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CandidatesController : ControllerBase
    {
        private readonly UseCaseHandler _handler;
        public CandidatesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns products.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BaseSearch search,
                                 [FromServices] IGetCandidatesQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns a candidate based on ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Candidate with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        [AllowAnonymous]
        public IActionResult Get(int id, [FromServices] IFindCandidateQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new candidate.
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
        public IActionResult Post([FromForm] CreateCandidateApiDTO dto, 
                                  [FromServices] ICreateCommand<CandidateCreateDTO> command)
        {
            
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Resume.FileName);

            if(extension != ".pdf")
            {
                throw new InvalidOperationException("Unsupported format for resume,try with .pdf");
            }

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot","resumes",newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Resume.CopyTo(fileStream);

            }

            dto.CV = newFileName;
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        /// <summary>
        /// Updates a candidate with the given id.
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
                                 [FromBody] CandidateUpdateDTO dto, 
                                 [FromServices] IUpdateCommand<CandidateUpdateDTO> command)
        {
            dto.Id = id;
            _handler.HandleCommand(command, dto);
            return StatusCode(204);
        }
    }
}
