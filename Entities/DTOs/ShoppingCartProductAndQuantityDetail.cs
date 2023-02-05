using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.DTOs
{
    public class ShoppingCartProductAndQuantityDetail:IDto
    {
        public int ProductId { get; set; }
        public int Quanity { get; set; }
    }
}
