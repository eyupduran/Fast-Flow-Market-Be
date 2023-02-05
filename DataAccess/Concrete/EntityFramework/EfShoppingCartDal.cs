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


namespace DataAccess.Concrete.EntityFramework
{
    public class EfShoppingCartDal : EfEntityRepositoryBase<ShoppingCart, ETradeContext>, IShoppingCartDal
    {
        public List<ShoppingCart> GetShoppingCartDetailByUserIdAndProductId(int userId, int productId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from sc in context.ShoppingCarts
                             join p in context.Products on sc.ProductId equals p.ProductId
                             join u in context.Users on sc.UserId equals u.Id
                             where userId == sc.UserId 
                             where productId == p.ProductId
                             select new ShoppingCart
                             {
                                 ShoppingCartId = sc.ShoppingCartId,
                                 ProductId = sc.ProductId,
                                 UserId = sc.UserId
                             };
                return result.ToList();
            }
        }

        public List<ShoppingCartProductAndQuantityDetail> GetShoppingCartProductAndQuantityDetailByUserId(int userId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from sc in context.ShoppingCarts
                             join p in context.Products on sc.ProductId equals p.ProductId
                             join u in context.Users on sc.UserId equals u.Id
                             where userId == sc.UserId
                             select new ShoppingCartProductAndQuantityDetail
                             {
                                 ProductId = sc.ProductId,
                                 Quanity = sc.Quantity
                             };
                return result.ToList();
            }
        }

        public List<ShoppingCartDetailDto> GetShoppingCartProductsDetailByUserId(int userId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from sc in context.ShoppingCarts
                             join p in context.Products on sc.ProductId equals p.ProductId
                             join u in context.Users on sc.UserId equals u.Id
                             join pı in context.ProductImages on p.ProductImageId equals pı.ProductImageId
                             where userId == sc.UserId   
                             select new ShoppingCartDetailDto
                             {
                                 ShoppingCartId = sc.ShoppingCartId,
                                 ProductId = sc.ProductId,
                                 ProductName=p.ProductName,
                                 Description=p.Description,
                                 UnitPrice=p.UnitPrice,
                                 CategoryId=p.CategoryId,
                                 ImagePath=pı.ImagePath,
                                 UserId=sc.UserId,
                                 FirstName=u.FirstName,
                                 LastName=u.LastName,
                                 Quantity=sc.Quantity
                             };
                return result.ToList();
            }
        }

    }
}
