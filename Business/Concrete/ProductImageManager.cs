using Business.Abstract;
using Business.Constants;
using Core.Entities.Concrete;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class ProductImageManager:IProductImageService
    {
        public IProductImageDal _productImageDal;
        public ProductImageManager(IProductImageDal productImageDal)
        {
            _productImageDal = productImageDal;
        }


        public IDataResult<ProductImage> Add(IFormFile file, ProductImage productImage)
        {
            productImage.ImagePath = FileHelper.AddAsync(file);
            _productImageDal.Add(productImage);
            return new SuccessDataResult<ProductImage>(productImage,"Ürün ekleme Başarılı");
        }

        public IResult Delete(ProductImage productImage)
        {
            _productImageDal.Delete(productImage);
            return new SuccessResult("Başarılı");
        } 

        public IDataResult<List<ProductImage>> GetAll()
        {
            var productImages = _productImageDal.GetAll();
            return new SuccessDataResult<List<ProductImage>>(productImages, "Başarılı");
        }


        public IResult Update(IFormFile file, ProductImage productImage)
        {
            _productImageDal.Update(productImage);
            return new SuccessResult("Başa");
        }
    }
}
