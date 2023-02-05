using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Concrete
{
    public class Order:IEntity
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public string OrderDate { get; set; }
        public int CargoId { get; set; }
        public int UserId { get; set; }
        public int OrderStatusId { get; set; }
        public int Quantity { get; set; }


    }
}
