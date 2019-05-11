using AutoMapper;
using CQRS.MediatR.Security;
using MediatR;
using RepositoryInterface.UserRepostory;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.User.Command.CreateUser
{
    public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Int64>
    {
        private readonly IMapper _mapper;
        private readonly IUserCommandRepository _userCommandRepository;
        private readonly Hashing _hashing;

        public CreateUserCommandHandler(IMapper mapper
                                       , IUserCommandRepository userCommandRepository
                                       , Hashing hashing
                                       )
        {
            this._mapper = mapper;
            this._userCommandRepository = userCommandRepository;
            this._hashing = hashing;
        }

        public async Task<long> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            var userName = await this._userCommandRepository.GetUserName(request.UserName);

            if (userName == null)
            {
                var hashAndSalt = this._hashing.GenerateHashWithSalt(request.Password);

                Domain.User user = this._mapper.Map<Domain.User>(request);
                user.PasswordHash = hashAndSalt.hash;
                user.PasswordSalt = hashAndSalt.salt;

                var userId = await this._userCommandRepository.CreateUser(user);

                return userId;
            }
            else
            {
                return 15;
            }

        }
    }
}
