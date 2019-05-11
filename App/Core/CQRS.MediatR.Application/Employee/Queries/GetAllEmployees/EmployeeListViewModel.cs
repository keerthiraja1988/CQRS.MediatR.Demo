using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Employee.Queries.GetAllEmployees
{
    public class EmployeeListViewModel
    {
        public List<EmployeeDto> Employees { get; set; }
    }
}
