using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Authrization.Query
{
    public class AuthrizationViewModel
    {
        public string JwtSecurityToken { get; set; }

        public DateTime ExpiresOn { get; set; }

    }
}

