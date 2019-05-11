using System;

namespace CQRS.MediatR.Domain
{
    public class User
    {
        public Int64 UserId { get; set; }

        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public string Password { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }

        public bool IsActive { get; set; }
        public bool IsLocked { get; set; }

        public DateTime CreatedOn { get; set; }
        public Int64 CreatedBy { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }
    }
}
