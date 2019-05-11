using AutoMapper;
using MediatR;
using RepositoryInterface.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Employee.Queries.GetEmployee
{

    public class GetEmployeeQueryHandler : IRequestHandler<GetEmployeeQuery, EmployeeViewModel>
    {
        private readonly IMapper _mapper;
        private readonly IEmployeeQueryRepository _employeeQueryRepository;

        public GetEmployeeQueryHandler(IMapper mapper, IEmployeeQueryRepository employeeQueryRepository)
        {
            this._mapper = mapper;
            this._employeeQueryRepository = employeeQueryRepository;
        }

        public async Task<EmployeeViewModel> Handle(GetEmployeeQuery request, CancellationToken cancellationToken)
        {
            EmployeeViewModel employeeViewModel = new EmployeeViewModel();

            var employee = await this._employeeQueryRepository.GetEmployee(request.EmployeeId);

            employeeViewModel = _mapper.Map<EmployeeViewModel>(employee);

            //if (EmployeeViewModel == null)
            //{
            //    throw new NotFoundException(nameof(Product), request.Id);
            //}

            //// TODO: Set view model state based on user permissions.
            //product.EditEnabled = true;
            //product.DeleteEnabled = false;

            return employeeViewModel;
        }
    }
}
