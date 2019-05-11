using AutoMapper;
using CQRS.MediatR.Security;
using MediatR;
using RepositoryInterface.AuthrizationRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Authrization.Query
{
    public class GetAuthrizationTokenQueryHandler : IRequestHandler<GetAuthrizationTokenQuery, AuthrizationViewModel>
    {
        private readonly IMapper _mapper;
        private readonly IAuthrizationQueryRepository _authrizationQueryRepository;
        private readonly Hashing _hashing;
        private readonly JwtSecurity _jwtSecurity;

        public GetAuthrizationTokenQueryHandler(IMapper mapper
                                                , IAuthrizationQueryRepository authrizationQueryRepository
                                                , Hashing hashing
                                                , JwtSecurity jwtSecurity)
        {
            this._mapper = mapper;
            this._authrizationQueryRepository = authrizationQueryRepository;
            this._hashing = hashing;
            this._jwtSecurity = jwtSecurity;
        }

        public async Task<AuthrizationViewModel> Handle(GetAuthrizationTokenQuery request, CancellationToken cancellationToken)
        {
            Domain.Authrization authrization = new Domain.Authrization();
            string key1 = "401b09eab3c013d4ca54922bb802bec8fd5318192b0a75f201d8b372742" +
                        "9090fb337591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed1";
            DateTime tokenExpiration = DateTime.Now.AddDays(1);

            authrization = await this._authrizationQueryRepository.GetUserCredential(request.UserName);

            bool IsUserCredentialValid = this._hashing.ValidatePassword(
                                             request.Password
                                            , authrization.PasswordHash
                                            , authrization.PasswordSalt);

            var result = this._jwtSecurity.JwtSecurityTokenGenerator(key1, tokenExpiration, request.UserName);

            AuthrizationViewModel authrizationViewModel = new AuthrizationViewModel();
            authrizationViewModel.JwtSecurityToken = result;
            authrizationViewModel.ExpiresOn = tokenExpiration;

            return authrizationViewModel;
        }
    }
}
