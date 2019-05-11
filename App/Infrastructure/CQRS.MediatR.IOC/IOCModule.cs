using Autofac;
using CQRS.MediatR.Application.Employee.Queries.GetEmployee;
using CQRS.MediatR.Security;
using Insight.Database;
using MediatR;
using RepositoryInterface.AuthrizationRepository;
using RepositoryInterface.EmployeeRepository;
using RepositoryInterface.UserRepostory;
using System;
using System.Data.Common;
using System.Data.SqlClient;
using System.Reflection;

namespace CQRS.MediatR.IOC
{
    public class ApplicationModuleIOC : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            //mediator itself
            builder
              .RegisterType<Mediator>()
              .As<IMediator>()
              .InstancePerLifetimeScope();

            builder.RegisterType<Hashing>();
            builder.RegisterType<JwtSecurity>();

            //// request & notification handlers
            builder.Register<ServiceFactory>(context =>
            {
                var c = context.Resolve<IComponentContext>();
                return t => c.Resolve(t);
            });

            builder.RegisterAssemblyTypes(typeof(GetEmployeeQueryHandler).GetTypeInfo().Assembly).AsImplementedInterfaces(); // via assembly scan

            base.Load(builder);
        }

    }

    public class RepositoryModuleIOC : Autofac.Module
    {

        private readonly DbConnection _sqlConnection;

        public RepositoryModuleIOC(string sqlConnectionString)
        {
            this._sqlConnection = new SqlConnection(sqlConnectionString);
        }

        protected override void Load(ContainerBuilder builder)
        {
            SqlInsightDbProvider.RegisterProvider();

            builder.Register(b => this._sqlConnection.AsParallel<IEmployeeQueryRepository>());
            builder.Register(b => this._sqlConnection.AsParallel<IEmployeeCommandRepository>());
            builder.Register(b => this._sqlConnection.AsParallel<IUserCommandRepository>());
            builder.Register(b => this._sqlConnection.AsParallel<IUserQueryRepository>());
            builder.Register(b => this._sqlConnection.AsParallel<IAuthrizationQueryRepository>());

            base.Load(builder);
        }
    }
}

