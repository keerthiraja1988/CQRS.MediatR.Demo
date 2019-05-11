using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Employee.Queries.GetEmployee
{
    public class GetEmployeeQuery : IRequest<EmployeeViewModel>
    {
        public int EmployeeId { get; set; }
    }
}
