using Business.Abstract;
using Core.Utilities.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class OrderStatusManager : IOrderStatusService
    {
        private IOrderStatusDal _orderStatusDal;

        public OrderStatusManager(IOrderStatusDal orderStatusDal)
        {
                _orderStatusDal=orderStatusDal;
        }

        public IResult Add(OrderStatus orderStatus)
        {
            _orderStatusDal.Add(orderStatus);
            return new SuccessResult("Order Status added");
        }

        public IResult Delete(OrderStatus orderStatus)
        {
            _orderStatusDal.Delete(orderStatus);
            return new SuccessResult("Order Status deleted");
        }

        public IDataResult<List<OrderStatus>> GetAll()
        {
            return new SuccessDataResult<List<OrderStatus>>(_orderStatusDal.GetAll(), "Order Status  listed");
        }

        public IDataResult<OrderStatus> GetById(int orderStatusId)
        {
            return new SuccessDataResult<OrderStatus>(_orderStatusDal.Get(os => os.OrderStatusId== orderStatusId));

        }
        public IResult Update(OrderStatus orderStatus)
        {
            _orderStatusDal.Update(orderStatus);

            return new SuccessResult();

        }
    }
}
