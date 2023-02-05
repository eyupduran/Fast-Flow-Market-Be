using Core.Utilities.Results;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IBankAccountService
    {
        IDataResult<List<BankAccount>> GetAll();
        IResult Add(BankAccount bankAccount);
        IResult Delete(BankAccount bankAccount);
        IResult Update(BankAccount bankAccount);
        IDataResult<BankAccount> GetById(int bankAccounId);
    }
}
