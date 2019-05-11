using AutoMapper;
using MediatR;
using RepositoryInterface.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Employee.Command.UpdateEmployee
{
    public class UpdateEmployeeCommandHandler : IRequestHandler<UpdateEmployeeCommand, Unit>
    {
        private readonly IMapper _mapper;
        private readonly IEmployeeCommandRepository _employeeCommandRepository;

        public UpdateEmployeeCommandHandler(IMapper mapper, IEmployeeCommandRepository employeeCommandRepository)
        {
            this._mapper = mapper;
            this._employeeCommandRepository = employeeCommandRepository;
        }

        public async Task<Unit> Handle(UpdateEmployeeCommand request, CancellationToken cancellationToken)
        {
            CQRS.MediatR.Domain.Employee employee = this._mapper.Map<CQRS.MediatR.Domain.Employee>(request);

            await this._employeeCommandRepository.UpdateEmployee(employee);

            return Unit.Value;
        }
    }
}
