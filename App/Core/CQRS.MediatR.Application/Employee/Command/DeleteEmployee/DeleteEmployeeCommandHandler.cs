using AutoMapper;
using MediatR;
using RepositoryInterface.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Employee.Command.DeleteEmployee
{

    public class DeleteEmployeeCommandHandler : IRequestHandler<DeleteEmployeeCommand>
    {
        private readonly IMapper _mapper;
        private readonly IEmployeeCommandRepository _employeeCommandRepository;

        public DeleteEmployeeCommandHandler(IMapper mapper, IEmployeeCommandRepository employeeCommandRepository)
        {
            this._mapper = mapper;
            this._employeeCommandRepository = employeeCommandRepository;
        }

        public async Task<Unit> Handle(DeleteEmployeeCommand request, CancellationToken cancellationToken)
        {
            await this._employeeCommandRepository.DeleteEmployee(request.EmployeeId);

            return Unit.Value;
        }
    }
}