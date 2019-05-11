using Insight.Database;
using System;
using System.Collections.Generic;
using System.Text;
using CQRS.MediatR.Domain;
using System.Threading.Tasks;

namespace RepositoryInterface.UserRepostory
{

    public interface IUserCommandRepository
    {

        [Sql("SELECT [UserName] FROM [dbo].[User] WHERE [UserName] = @userName")]
        Task<string> GetUserName(string userName);

        [Sql("[P_CreateUser]")]      
        Task<Int64> CreateUser(User user);
    }
}
