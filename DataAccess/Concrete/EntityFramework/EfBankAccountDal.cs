﻿using Core.DataAcess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfBankAccountDal: EfEntityRepositoryBase<BankAccount, ETradeContext>, IBankAccountDal
    {
    }
}
