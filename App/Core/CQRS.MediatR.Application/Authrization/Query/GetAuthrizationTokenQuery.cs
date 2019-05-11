using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Authrization.Query
{
    public class GetAuthrizationTokenQuery : IRequest<AuthrizationViewModel>
    {
        public string UserName { get; set; }

        public string Password { get; set; }
    }
}
