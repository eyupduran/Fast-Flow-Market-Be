using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Concrete
{
    public class OrderStatus:IEntity
    {
        public int OrderStatusId { get; set; }
        public string Status { get; set; }
    }
}
