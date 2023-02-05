using Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Concrete
{
    public class BankAccount: IEntity
    {
        public int BankAccountId { get; set; }
        public int UserId { get; set; }
        public string CartNumber { get; set; }
        public string CartName { get; set; }
        public string ExpirationDate { get; set; }
        public string SecurityCode { get; set; }
        public string IbanNo { get; set; }






    }
}
