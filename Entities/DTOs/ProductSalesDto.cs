using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.DTOs
{
    public class ProductSalesDto:IDto
    {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public int TotalSales { get; set; }
            public string ImagePath { get; set; }
            public int ProductImageId { get; set; }
            public string Description { get; set; }
            public int UnitPrice { get; set; }
            public int NumberOfPurchasers { get; set; }
          

    }
}
