using Insight.Database;
using System;
using System.Collections.Generic;
using System.Text;
using CQRS.MediatR.Domain;
using System.Threading.Tasks;

namespace RepositoryInterface.AuthrizationRepository
{

    public interface IAuthrizationQueryRepository
    {
        [Sql("SELECT [UserName],[Password],[PasswordHash],[PasswordSalt],[IsActive],[IsLocked] FROM [dbo].[User] WHERE [UserName] = @userName")]
        Task<Authrization> GetUserCredential(string userName);
    }
}
