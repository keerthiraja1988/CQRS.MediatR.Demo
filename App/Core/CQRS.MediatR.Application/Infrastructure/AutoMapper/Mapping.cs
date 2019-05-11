using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;

namespace CQRS.MediatR.Application.Infrastructure.AutoMapper
{
    public interface IHaveCustomMapping
    {
        void CreateMappings(Profile configuration);
    }

    public interface IMapFrom<TEntity>
    {
    }

    public interface IMapTo<TEntity>
    {
    }
}
