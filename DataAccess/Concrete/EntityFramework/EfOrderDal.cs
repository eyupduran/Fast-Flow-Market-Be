using Core.DataAcess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Linq.Expressions;
using System.Xml.Linq;
using Core.Entities.Concrete;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfOrderDal : EfEntityRepositoryBase<Order, ETradeContext>, IOrderDal
    {
        public List<OrderDetailDto> GetOrdersDetailByUserId(int userId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from o in context.Orders
                             join p in context.Products on o.ProductId equals p.ProductId   
                             join u in context.Users on o.UserId equals u.Id
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             join os in context.OrderStatues on o.OrderStatusId equals os.OrderStatusId
                             join c in context.Cargoes on o.CargoId equals c.CargoId
                             where userId == o.UserId
                             select new OrderDetailDto
                             {
                                  OrderId=o.OrderId,
                                  ProductId =p.ProductId,
                                  UnitPrice =p.UnitPrice,
                                  ProductName =p.ProductName,
                                  Quantity =o.Quantity,
                                  Description =p.Description,
                                  ImagePath =pi.ImagePath,
                                  OrderDate =o.OrderDate,
                                  OrderStatus =os.Status,
                                  CargoName = c.CargoName
               };
                return result.ToList();
            }
        }
    }
}