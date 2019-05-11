using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Employee.Queries.GetEmployee
{
    public class EmployeeViewModel
    {
        public int EmployeeId { get; set; }

        public string FullName { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Initial { get; set; }

        public DateTime DateOfBirth { get; set; }
    }
}
