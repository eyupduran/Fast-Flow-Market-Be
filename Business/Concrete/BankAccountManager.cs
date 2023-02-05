using Business.Abstract;
using Core.Utilities.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class BankAccountManager:IBankAccountService
    {
        private IBankAccountDal _bankAccountDal;
        public BankAccountManager(IBankAccountDal bankAccountDal)
        {
            _bankAccountDal = bankAccountDal;
        }

        public IResult Add(BankAccount bankAccount)
        {
            _bankAccountDal.Add(bankAccount);
            return new SuccessResult("Bank Account added");
        }

        public IResult Delete(BankAccount bankAccount)
        {
            _bankAccountDal.Delete(bankAccount);
            return new SuccessResult("Bank Account deleted");
        }

        public IDataResult<List<BankAccount>> GetAll()
        {
            return new SuccessDataResult<List<BankAccount>>(_bankAccountDal.GetAll(), "Bank Account listed");
        }

        public IDataResult<BankAccount> GetById(int bankAccountId)
        {
            return new SuccessDataResult<BankAccount>(_bankAccountDal.Get(b => b.BankAccountId== bankAccountId));

        }
        public IResult Update(BankAccount bankAccount)
        {
            _bankAccountDal.Update(bankAccount);

            return new SuccessResult();

        }
    }
}
