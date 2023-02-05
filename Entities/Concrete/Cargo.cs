using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Concrete
{
    public class Cargo:IEntity
    {
        public int CargoId { get; set; }
        public string CargoName { get; set; }
    }
}
