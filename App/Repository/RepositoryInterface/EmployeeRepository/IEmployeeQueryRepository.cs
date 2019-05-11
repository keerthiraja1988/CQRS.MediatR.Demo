using Insight.Database;
using System;
using System.Collections.Generic;
using System.Text;
using CQRS.MediatR.Domain;
using System.Threading.Tasks;

namespace RepositoryInterface.EmployeeRepository
{

    public interface IEmployeeQueryRepository
    {
        [Sql("[P_GetEmployee]")]
        Task<Employee> GetEmployee(int employeeId);

        [Sql("SELECT *  FROM Employee")]
        Task<List<Employee>> GetAllEmployees();
    }
}
