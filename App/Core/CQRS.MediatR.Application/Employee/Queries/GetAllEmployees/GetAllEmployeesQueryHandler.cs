using AutoMapper;
using MediatR;
using RepositoryInterface.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Employee.Queries.GetAllEmployees
{

    public class GetAllEmployeesQueryHandler : IRequestHandler<GetAllEmployeesQuery, EmployeeListViewModel>
    {

        private readonly IMapper _mapper;
        private readonly IEmployeeQueryRepository _employeeQueryRepository;

        public GetAllEmployeesQueryHandler(IMapper mapper, IEmployeeQueryRepository employeeQueryRepository)
        {
            this._mapper = mapper;
            this._employeeQueryRepository = employeeQueryRepository;
        }

        public async Task<EmployeeListViewModel> Handle(GetAllEmployeesQuery request, CancellationToken cancellationToken)
        {
            EmployeeListViewModel employeeListViewModel = new EmployeeListViewModel();

            var employees = await this._employeeQueryRepository.GetAllEmployees();
            employeeListViewModel.Employees = _mapper.Map<List<EmployeeDto>>(employees);

           return employeeListViewModel;
        }
    }
}
