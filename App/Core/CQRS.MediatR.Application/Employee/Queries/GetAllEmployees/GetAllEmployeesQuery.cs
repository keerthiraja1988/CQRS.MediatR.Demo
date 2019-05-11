using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Employee.Queries.GetAllEmployees
{
    public class GetAllEmployeesQuery : IRequest<EmployeeListViewModel>
    {
    }
}
