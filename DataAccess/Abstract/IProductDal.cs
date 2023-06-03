using Core.DataAccess;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Abstract
{
    public interface IProductDal : IEntityRepository<Product>
    {
        List<ProductDetailDto> GetAllProductDetails();
        List<ProductDetailDto> GetAllProductDetailByCategoryId(int categoryId);
        ProductDetailDto GetProductDetailByProductId(int productId);

        List<ProductSalesDto> GetProductSaleByUserId(int userId);
        List<ProductDetailDto> GetProductsByUserId(int userId);

    }
}