using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CQRS.MediatR.Application.Employee.Command.CreateEmployee;
using CQRS.MediatR.Application.Employee.Command.DeleteEmployee;
using CQRS.MediatR.Application.Employee.Command.UpdateEmployee;
using CQRS.MediatR.Application.Employee.Queries.GetAllEmployees;
using CQRS.MediatR.Application.Employee.Queries.GetEmployee;
using FizzWare.NBuilder;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeManageController : ControllerBase
    {
        private readonly IMediator _mediator;

        public EmployeeManageController(IMediator mediator)
        {
            this._mediator = mediator;
        }

        // GET api/EmployeeManage
        [HttpGet("{employeeId}")]
        public async Task<ActionResult<EmployeeViewModel>> Get(int employeeId)
        {
            var employee = await this._mediator.Send(new GetEmployeeQuery { EmployeeId = employeeId });
            return Ok(employee);
        }

        // GET api/EmployeeManage
        [HttpGet]
        //[Authorize]
        public async Task<ActionResult> Get()
        {
            var employeeListViewModel = await this._mediator.Send(new GetAllEmployeesQuery());
            return Ok(employeeListViewModel.Employees);
        }

        // POST: api/EmployeeManage
        [HttpPost]
        public async Task<ActionResult<int>> Post([FromBody] CreateEmployeeCommand createEmployeeCommand)
        {
            var employeeId = await this._mediator.Send(createEmployeeCommand);

            return Ok(employeeId);
        }             

        // PUT: api/EmployeeManage/5
        [HttpPut("{employeeId}")]
        public async Task<ActionResult> Put([FromRoute] int employeeId,
            [FromBody] UpdateEmployeeCommand updateEmployeeCommand)
        {
            await this._mediator.Send(updateEmployeeCommand);
            return Ok();
        }
        
        // DELETE: api/products/5
        [HttpDelete("{employeeId}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesDefaultResponseType]
        public async Task<IActionResult> Delete(int employeeId)
        {
            DeleteEmployeeCommand deleteEmployeeCommand = new DeleteEmployeeCommand();
            deleteEmployeeCommand.EmployeeId = employeeId;

            await this._mediator.Send(deleteEmployeeCommand);

            return NoContent();
        }
    }
}