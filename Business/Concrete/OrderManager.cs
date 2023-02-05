using Business.Abstract;
using Core.Utilities.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class OrderManager:IOrderService
    {
        private IOrderDal _orderDal;
        public OrderManager(IOrderDal orderDal)
        {
            _orderDal = orderDal;
        }

        public IDataResult<Order> Add(Order order)
        {
            _orderDal.Add(order);
            return new SuccessDataResult<Order>(order);
        }

        public IResult Delete(Order order)
        {
            _orderDal.Delete(order);
            return new SuccessResult("Order deleted");
        }

        public IDataResult<List<Order>> GetAll()
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetAll(), "Orders listed");
        }

        public IDataResult<Order> GetById(int orderId)
        {
            return new SuccessDataResult<Order>(_orderDal.Get(o => o.OrderId == orderId));

        }

        public IDataResult<List<OrderDetailDto>> GetOrdersDetailByUserId(int userId)
        {
            return new SuccessDataResult<List<OrderDetailDto>>(_orderDal.GetOrdersDetailByUserId(userId), "başarılı");
        }

        public IResult Update(Order ordern)
        {
            _orderDal.Update(ordern);

            return new SuccessResult();

        }
    }
}
