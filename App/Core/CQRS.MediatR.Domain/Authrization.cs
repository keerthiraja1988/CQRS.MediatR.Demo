using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Domain
{
    public class Authrization
    {
        public string UserName { get; set; }

        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }

        public bool IsActive { get; set; }
        public bool IsLocked { get; set; }
    }
}
