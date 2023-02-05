using Core.DataAccess;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Abstract
{
    public interface IShoppingCartDal : IEntityRepository<ShoppingCart>
    {
        List<ShoppingCart> GetShoppingCartDetailByUserIdAndProductId(int userId,int productId);
        List<ShoppingCartDetailDto> GetShoppingCartProductsDetailByUserId(int userId);
        List<ShoppingCartProductAndQuantityDetail> GetShoppingCartProductAndQuantityDetailByUserId(int userId); 

    }
}
