using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CQRS.MediatR.Application.User.Command.CreateUser;
using CQRS.MediatR.Application.User.Query.GetAllUsers;
using FizzWare.NBuilder;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UserController(IMediator mediator)
        {
            this._mediator = mediator;
        }

        // GET api/User
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            var userListViewModel = await this._mediator.Send(new GetAllUsersQuery());
            return Ok(userListViewModel.Users);
        }

        // HttpPost api/User
        [HttpPost]
        public async Task<ActionResult<long>> Post([FromBody] CreateUserCommand createUserCommand)
        {
            var userId = await this._mediator.Send(createUserCommand);

            return Ok(userId);
        }
    }
}