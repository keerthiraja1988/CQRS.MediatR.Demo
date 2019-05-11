using CQRS.MediatR.Domain;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryInterface.EmployeeRepository
{
    public interface IEmployeeCommandRepository
    {
        [Sql("[P_CreateEmployee]")]
        Task<int> CreateEmployee(Employee employee);

        [Sql("[P_UpdateEmployee]")]
        Task UpdateEmployee(Employee employee);

        [Sql("[P_DeleteEmployee]")]
        Task DeleteEmployee(int employeeId);
    }
}
