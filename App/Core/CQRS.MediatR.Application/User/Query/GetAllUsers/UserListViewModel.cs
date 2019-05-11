using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.User.Query.GetAllUsers
{
   public class UserListViewModel
    {
        public List<UserDto> Users { get; set; }
    }
}
