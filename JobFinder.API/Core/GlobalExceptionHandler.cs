using FluentValidation;
using JobFinder.Application.Exceptions;
using JobFinder.Application.Logging;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace JobFinder.API.Core
{
    public class GlobalExceptionHandler
    {
        private readonly RequestDelegate _next;
        private readonly IExceptionLogger _logger;

        public GlobalExceptionHandler(RequestDelegate next, IExceptionLogger logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                _logger.Log(ex);

                httpContext.Response.ContentType = "application/json";
                object response = null;
                var statusCode = StatusCodes.Status500InternalServerError;

                //entitet ne moze da se obradi 

                //

                if (ex is EntityNotFoundException notFoundEx)
                {
                    statusCode = StatusCodes.Status404NotFound;
                    response = new { message = notFoundEx.Message };
                }

                if (ex is ForbiddenAccessException fbEx)
                {
                    statusCode = StatusCodes.Status403Forbidden;
                    response = new { message = fbEx.Message };
                }

                
                if (ex is ForbiddenUseCaseExecutionException fEx)
                {
                    statusCode = StatusCodes.Status403Forbidden;
                    response = new { message = fEx.Message };
                }


                if (ex is ValidationException e)
                {
                    statusCode = StatusCodes.Status422UnprocessableEntity;
                    response = new
                    {
                        errors = e.Errors.Select(x => new
                        {
                            property = x.PropertyName,
                            error = x.ErrorMessage
                        })
                    };
                }


                if (ex is UnauthorizedAccessException unauthEx)
                {
                    statusCode = StatusCodes.Status401Unauthorized;
                    response = new { message = unauthEx.Message };
                }



                httpContext.Response.StatusCode = statusCode;
                if (response != null)
                {
                    await httpContext.Response.WriteAsJsonAsync(response);
                }
            }
        }
    }
}
