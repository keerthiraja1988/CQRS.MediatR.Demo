﻿using MediatR;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CQRS.MediatR.Application.Employee.Command.CreateEmployee
{
    public class EmployeeCreatedEmailNotification : INotificationHandler<CreateEmployeeCommand>
    {
        public Task Handle(CreateEmployeeCommand notification, CancellationToken cancellationToken)
        {
            Debug.WriteLine("Email Notification");
            return Task.CompletedTask;
        }
    }
}