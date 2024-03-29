﻿using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class CategoryManager : ICategoryService
    {
        private ICategoryDal _categoryDal;

        public CategoryManager(ICategoryDal categoryDal)
        {
            _categoryDal = categoryDal;
        }

        public IResult Add(Category category)
        {
           _categoryDal.Add(category);
            return new SuccessResult(Messages.CategoryAdded);


        }

        public IResult Delete(Category category)
        {
            _categoryDal.Delete(category);

            return new SuccessResult();
        }

        public IDataResult<List<Category>> GetAll()
        {
            return new SuccessDataResult<List<Category>>(_categoryDal.GetAll(), "Categoriler listelendi");
        }

        public IDataResult<Category> GetById(int categoryId)
        {
            return new SuccessDataResult<Category>(_categoryDal.Get(c => c.CategoryId==categoryId), "Categoriler listelendi");

        }

        public IResult Update(Category category)
        {
            _categoryDal.Update(category);
            return new SuccessResult("Kategori güncellendi");
        }
    }
}
