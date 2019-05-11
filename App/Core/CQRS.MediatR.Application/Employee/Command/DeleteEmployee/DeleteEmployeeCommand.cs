using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Employee.Command.DeleteEmployee
{
    public class DeleteEmployeeCommand : IRequest
    {
        public int EmployeeId { get; set; }
    }
}
