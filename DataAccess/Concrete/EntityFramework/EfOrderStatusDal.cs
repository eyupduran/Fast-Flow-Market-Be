﻿using Core.DataAcess.EntityFramework;
using Core.Entities.Concrete;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfOrderStatusDal : EfEntityRepositoryBase<OrderStatus, ETradeContext>, IOrderStatusDal
    {
    }
}
