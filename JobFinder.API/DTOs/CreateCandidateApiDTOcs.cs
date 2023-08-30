using JobFinder.Application.DTOs;
using Microsoft.AspNetCore.Http;

namespace JobFinder.API.DTOs
{
    public class CreateCandidateApiDTO : CandidateCreateDTO
    {
        public IFormFile Resume { get; set; }
    }
}
