﻿using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Concrete
{
    public class ProductImage : IEntity
    {
        public int ProductImageId { get; set; }
        public string ImagePath { get; set; }
    }
}
