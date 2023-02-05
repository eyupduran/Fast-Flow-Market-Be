using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business.Concrete
{
    public class ShoppingCartManager:IShoppingCartService
    {
        private IShoppingCartDal _shoppingCartDal;
        public ShoppingCartManager(IShoppingCartDal shoppingCartDal)
        {
            _shoppingCartDal = shoppingCartDal;
        }

        public IResult Add(ShoppingCart shoppingCart)
        {
            var result = GetShoppingCartDetailByUserIdAndProductId(shoppingCart.UserId, shoppingCart.ProductId);

            if (result.Data.Count>0)
            {
                return new ErrorResult("Bu ürünü alışveriş sepetine zaten eklediniz.");
            }
            else
            {
                shoppingCart.Quantity = 1;
              _shoppingCartDal.Add(shoppingCart);
               return new SuccessResult("Ürün sepete eklendi");
            }
          
        }


        public IResult Delete(ShoppingCart shoppingCart)
        {
            _shoppingCartDal.Delete(shoppingCart);
            return new SuccessResult("Ürün sepetten silindi");
        }

        public IDataResult<List<ShoppingCart>> GetAll()
        {
            return new SuccessDataResult<List<ShoppingCart>>(_shoppingCartDal.GetAll(), "Shopping Cart listed");
        }

        public IDataResult<ShoppingCart> GetById(int shoppingCartId)
        {
            return new SuccessDataResult<ShoppingCart>(_shoppingCartDal.Get(s => s.ShoppingCartId == shoppingCartId));

        }

        public IDataResult<ShoppingCart> GetByProductId(int productId)
        {
            return new SuccessDataResult<ShoppingCart>(_shoppingCartDal.Get(s => s.ProductId == productId));

        }

        public IDataResult<List<ShoppingCart>> GetShoppingCartDetailByUserIdAndProductId(int userId, int productId)
        {
            return new SuccessDataResult<List<ShoppingCart>>(_shoppingCartDal.GetShoppingCartDetailByUserIdAndProductId(userId, productId), "Başarılı");
        }

        public IDataResult<List<ShoppingCartProductAndQuantityDetail>> GetShoppingCartProductAndQuantityDetailByUserId(int userId)
        {
            return new SuccessDataResult<List<ShoppingCartProductAndQuantityDetail>>(_shoppingCartDal.GetShoppingCartProductAndQuantityDetailByUserId(userId),"Başarılı");
        }

        public IDataResult<List<ShoppingCartDetailDto>> GetShoppingCartProductsDetailByUserId(int userId)
        {
            return new SuccessDataResult<List<ShoppingCartDetailDto>>(_shoppingCartDal.GetShoppingCartProductsDetailByUserId(userId));
        }

        

        public IDataResult<ShoppingCart> Update(ShoppingCart shoppingCart)
        {
            _shoppingCartDal.Update(shoppingCart);

            return new SuccessDataResult<ShoppingCart>(shoppingCart);

        }
    }
}
