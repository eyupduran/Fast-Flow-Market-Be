using Core.Utilities.Results;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IShoppingCartService
    {
        IDataResult<List<ShoppingCart>> GetAll();
        IResult Add(ShoppingCart shoppingCart);
        IResult Delete(ShoppingCart shoppingCart);
        IDataResult<ShoppingCart> Update(ShoppingCart shoppingCart);
        IDataResult<ShoppingCart> GetById(int shoppingCartId);
        IDataResult<List<ShoppingCart>> GetShoppingCartDetailByUserIdAndProductId(int userId, int productId);
        IDataResult<List<ShoppingCartDetailDto>> GetShoppingCartProductsDetailByUserId(int userId);

        IDataResult<List<ShoppingCartProductAndQuantityDetail>> GetShoppingCartProductAndQuantityDetailByUserId(int userId);


    }
}
