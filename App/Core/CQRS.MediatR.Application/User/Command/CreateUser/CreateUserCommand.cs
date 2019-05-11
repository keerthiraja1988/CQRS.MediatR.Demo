using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.User.Command.CreateUser
{
    public class CreateUserCommand : IRequest<Int64>
    {
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public string Password { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }

        public bool IsActive { get; set; }
        public bool IsLocked { get; set; }

        public Int64 CreatedBy { get; set; }

       // public Int64 UserId { get; set; }
        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }
    }
}
