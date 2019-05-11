using AutoMapper;
using MediatR;
using RepositoryInterface.UserRepostory;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.User.Query.GetAllUsers
{

    public class GetAllEmployeesQueryHandler : IRequestHandler<GetAllUsersQuery, UserListViewModel>
    {

        private readonly IMapper _mapper;
        private readonly IUserQueryRepository _userQueryRepository;

        public GetAllEmployeesQueryHandler(IMapper mapper, IUserQueryRepository userQueryRepository)
        {
            this._mapper = mapper;
            this._userQueryRepository = userQueryRepository;
        }

        public async Task<UserListViewModel> Handle(GetAllUsersQuery request, CancellationToken cancellationToken)
        {
            UserListViewModel userListViewModel = new UserListViewModel();

            var users = await this._userQueryRepository.GetAllUsers();
            userListViewModel.Users = _mapper.Map<List<UserDto>>(users);

            return userListViewModel;
        }
    }
}
