using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.User.Query.GetAllUsers
{

    public class GetAllUsersQuery : IRequest<UserListViewModel>
    {
    }
}
