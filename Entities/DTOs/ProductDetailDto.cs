using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.DTOs
{
    public class ProductDetailDto:IDto
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public int UnitPrice { get; set; }
        public int CategoryId { get; set; }
        public int ProductImageId { get; set; }
        public string ImagePath { get; set; }
        public int UserId{ get; set; }
        public string SellerName { get; set; }



    }
}
