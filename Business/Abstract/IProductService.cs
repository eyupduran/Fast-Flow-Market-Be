using Core.Utilities.Results;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IProductService
    {
        IDataResult<Product> GetById(int productId);
        IDataResult<List<Product>> GetAll();
        IDataResult<List<ProductDetailDto>> GetAllProductDetailByCategoryId(int categoryId);
        IDataResult<List<Product>> GetByUnitPrice(decimal min, decimal max);
        IResult Add(Product product);
        IResult Delete(Product product);
        IResult Update(Product product);
        IResult AddTransactionalTest(Product product);

        IDataResult<List<ProductDetailDto>> GetAllProductDetails();
        IResult AddProductDetail(ProductDetailDto productDetailDto);
        IDataResult<List<ProductSalesDto>> GetProductSaleByUserId(int userId);

        IDataResult<ProductDetailDto> GetProductDetailByProductId(int productId);

        IDataResult<List<ProductDetailDto>> GetProductsByUserId(int userId);

    }
}