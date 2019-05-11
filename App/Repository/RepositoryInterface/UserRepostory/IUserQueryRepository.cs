using Insight.Database;
using System;
using System.Collections.Generic;
using System.Text;
using CQRS.MediatR.Domain;
using System.Threading.Tasks;

namespace RepositoryInterface.UserRepostory
{
    public interface IUserQueryRepository
    {
        [Sql("SELECT *  FROM dbo.[User]")]
        Task<List<User>> GetAllUsers();
    }
}
