using System.Threading.Tasks;
using CQRS.MediatR.Application.Authrization.Query;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly IMediator _mediator;

        public AuthenticationController(IMediator mediator)
        {
            this._mediator = mediator;
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<ActionResult<AuthrizationViewModel>> RequestAuthrizationToken([FromBody] GetAuthrizationTokenQuery getAuthrizationTokenQuery)
        {
            var authrizationViewModel = await this._mediator.Send(getAuthrizationTokenQuery);
            return authrizationViewModel;
        }
    }
}
