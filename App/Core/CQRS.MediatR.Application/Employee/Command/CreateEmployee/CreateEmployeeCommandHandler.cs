﻿using AutoMapper;
using MediatR;
using RepositoryInterface.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using CQRS.MediatR.Domain;

namespace CQRS.MediatR.Application.Employee.Command.CreateEmployee
{
    public class CreateEmployeeCommandHandler : IRequestHandler<CreateEmployeeCommand, int>
    {
        private readonly IMapper _mapper;
        private readonly IEmployeeCommandRepository _employeeCommandRepository;
        private readonly IMediator _mediator;

        public CreateEmployeeCommandHandler(
            IMapper mapper,
            IEmployeeCommandRepository employeeCommandRepository,
              IMediator mediator)
        {
            this._mapper = mapper;
            this._employeeCommandRepository = employeeCommandRepository;
            _mediator = mediator;
        }

        public async Task<int> Handle(CreateEmployeeCommand request, CancellationToken cancellationToken)
        {
            CQRS.MediatR.Domain.Employee employee = this._mapper.Map<CQRS.MediatR.Domain.Employee>(request);

            int employeeId = await this._employeeCommandRepository.CreateEmployee(employee);
            request.EmployeeId = employeeId;

            await _mediator.Publish(request);

            return employeeId;
        }
    }
}