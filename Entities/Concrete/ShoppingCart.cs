using Core.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Entities.Concrete
{
    public class ShoppingCart:IEntity
    {
        public int ShoppingCartId { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }

        public int Quantity { get; set; }


    }
}
