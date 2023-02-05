﻿using Core.Utilities.Results;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IProductImageService
    {
        IDataResult<List<ProductImage>> GetAll();
        IDataResult<ProductImage> Add(IFormFile file, ProductImage usProductImage);
        IResult Update(IFormFile file, ProductImage usProductImage);
        IResult Delete(ProductImage productImage);
    }
}
