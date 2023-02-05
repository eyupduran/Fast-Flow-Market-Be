using Core.DataAccess;
using Core.DataAcess.EntityFramework;
using Core.Entities;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.DTOs;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Xml.Linq;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfProductDal : EfEntityRepositoryBase<Product, ETradeContext>, IProductDal
    {
        public IProductDal _productDal;
        public IProductImageDal _productImageDal;
        public void AddProductDetail(ProductDetailDto productDetailDto)
        {
            using (ETradeContext context = new ETradeContext())
            {

                ProductImage productImage = new ProductImage();
                productImage.ProductImageId = productDetailDto.ProductImageId;
                productImage.ImagePath = productDetailDto.ImagePath;

                var addedEntity2 = context.Entry(productImage);
                addedEntity2.State = EntityState.Added;
                context.SaveChanges();

                Product product = new Product();
                product.ProductId = productDetailDto.ProductId; 
                product.ProductName = productDetailDto.ProductName;
                product.Description = productDetailDto.Description;
                product.UnitPrice=productDetailDto.UnitPrice;
                product.CategoryId = productDetailDto.CategoryId;
                product.ProductImageId = productImage.ProductImageId;

                var addedEntity1 = context.Entry(product);
                addedEntity1.State = EntityState.Added;
                context.SaveChanges();
           
           
            }
        }

        public List<ProductDetailDto> GetAllProductDetailByCategoryId(int categoryId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from p in context.Products
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             where categoryId==p.CategoryId
                             select new ProductDetailDto
                             {
                                 ProductImageId = p.ProductImageId,
                                 ProductId = p.ProductId,
                                 ImagePath = pi.ImagePath,
                                 ProductName = p.ProductName,
                                 Description = p.Description,
                                 UnitPrice = p.UnitPrice,
                                 CategoryId = p.CategoryId,
                                 UserId = p.UserId

                             };
                return result.ToList();
            }
        }

        public List<ProductDetailDto> GetAllProductDetails()
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from p in context.Products
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             join u in context.Users on p.UserId equals u.Id

                             select new ProductDetailDto
                             {
                                 ProductImageId = p.ProductImageId,
                                 ProductId = p.ProductId,
                                 ImagePath = pi.ImagePath,
                                 ProductName = p.ProductName,
                                 Description = p.Description,
                                 UnitPrice = p.UnitPrice,
                                 CategoryId = p.CategoryId,
                                 UserId= p.UserId,
                                 SellerName = u.FirstName + " " + u.LastName
                             };
                return result.ToList();
            }
        }

        public ProductDetailDto GetProductDetailByProductId(int productId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from p in context.Products
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             join u in context.Users on p.UserId equals u.Id
                             where productId == p.ProductId
                             select new ProductDetailDto
                             {
                                 ProductImageId = p.ProductImageId,
                                 ProductId = p.ProductId,
                                 ImagePath = pi.ImagePath,
                                 ProductName = p.ProductName,
                                 Description = p.Description,
                                 UnitPrice = p.UnitPrice,
                                 CategoryId = p.CategoryId,
                                 UserId = p.UserId,
                                 SellerName = u.FirstName +" " + u.LastName

                             };
                return result.SingleOrDefault();
            }
        }

        public List<ProductSalesDto> GetProductSaleByUserId(int userId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from o in context.Orders
                             join p in context.Products on o.ProductId equals p.ProductId
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             where p.UserId == userId
                             group new { o, p, pi } by new {p.ProductId ,p.ProductName, pi.ImagePath, pi.ProductImageId, p.Description, p.UnitPrice } into g
                             select new ProductSalesDto
                             {
                                 ProductId=g.Key.ProductId,
                                 ProductName = g.Key.ProductName,
                                 TotalSales = g.Sum(x => x.o.Quantity),
                                 ImagePath = g.Key.ImagePath,
                                 ProductImageId = g.Key.ProductImageId,
                                 Description = g.Key.Description,
                                 UnitPrice=g.Key.UnitPrice,
                                 NumberOfPurchasers = g.Count()
           
                             };

                return result.ToList();
            }
        }

        public List<ProductDetailDto> GetProductsByUserId(int userId)
        {
            using (ETradeContext context = new ETradeContext())
            {
                var result = from p in context.Products
                             join pi in context.ProductImages on p.ProductImageId equals pi.ProductImageId
                             join u in context.Users on p.UserId equals u.Id
                             where userId == p.UserId
                             select new ProductDetailDto
                             {
                                 ProductImageId = p.ProductImageId,
                                 ProductId = p.ProductId,
                                 ImagePath = pi.ImagePath,
                                 ProductName = p.ProductName,
                                 Description = p.Description,
                                 UnitPrice = p.UnitPrice,
                                 CategoryId = p.CategoryId,
                                 UserId = p.UserId,
                                 SellerName = u.FirstName + " " + u.LastName

                             };
                return result.ToList();
            }
        }
    }

       
    }


  
  
  
 
  
  
  