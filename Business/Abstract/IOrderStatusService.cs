using Core.Utilities.Results;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IOrderStatusService
    {
        IDataResult<List<OrderStatus>> GetAll();
        IResult Add(OrderStatus orderStatus);
        IResult Delete(OrderStatus orderStatus);
        IResult Update(OrderStatus orderStatus);
        IDataResult<OrderStatus> GetById(int orderStatusId);
    }
}
