using JobFinder.API.Core;
using JobFinder.Application.DTOs.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JobFinder.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        private readonly JwtManager _manager;

        public AuthController(JwtManager manager)
        {
            _manager = manager;
        }

        /// <summary>
        /// Generates and returns a token from correct user credentials.
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        /// <response code="200">Successfull authentication.</response>
        /// <response code="403">Incorrect credentials.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromBody] AuthDTO request)
        {
            var token = _manager.MakeToken(request.Email, request.Password);

            return Ok(new { token });
        }     
    }
}
