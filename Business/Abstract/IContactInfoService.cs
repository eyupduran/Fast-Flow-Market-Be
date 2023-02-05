using Core.Utilities.Results;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface IContactInfoService
    {
        IDataResult<List<ContactInfo>> GetAll();
        IDataResult<ContactInfo> Add(ContactInfo contactInfo);
        IResult Delete(ContactInfo contactInfo);
        IResult Update(ContactInfo contactInfo);
        IDataResult<ContactInfo> GetById(int contactInfoId);

        IDataResult<ContactInfo> GetContactInfoByUserId(int userId);
    }
}
