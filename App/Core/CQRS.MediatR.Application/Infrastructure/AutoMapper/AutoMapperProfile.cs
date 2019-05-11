using AutoMapper;
using CQRS.MediatR.Application.User.Command.CreateUser;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace CQRS.MediatR.Application.Infrastructure.AutoMapper
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {

            CreateMap<CreateUserCommand, Domain.User>().ReverseMap()
                .ForAllOtherMembers(opt => opt.Ignore());

            LoadStandardMappings();
            LoadCustomMappings();
            LoadConverters();
        }

        private void LoadConverters()
        {

        }

        private void LoadStandardMappings()
        {
            var mapsFrom = MapperProfileHelper.LoadStandardMappings(Assembly.GetExecutingAssembly());

            foreach (var map in mapsFrom)
            {
                CreateMap(map.Source, map.Destination).ReverseMap()
                    .ForAllOtherMembers(opts => opts.Ignore());
                

            }
        }

        private void LoadCustomMappings()
        {
            var mapsFrom = MapperProfileHelper.LoadCustomMappings(Assembly.GetExecutingAssembly());

            foreach (var map in mapsFrom)
            {
                map.CreateMappings(this);
            }
        }


    }

    public static class test
    {
        public static IMappingExpression<TSource, TDestination> IgnoreAllNonExisting<TSource, TDestination>
(this IMappingExpression<TSource, TDestination> expression)
        {
            var flags = BindingFlags.Public | BindingFlags.Instance;
            var sourceType = typeof(TSource);
            var destinationProperties = typeof(TDestination).GetProperties(flags);

            foreach (var property in destinationProperties)
            {
                if (sourceType.GetProperty(property.Name, flags) == null)
                {
                    expression.ForMember(property.Name, opt => opt.Ignore());
                }
            }
            return expression;
        }
    }

}
