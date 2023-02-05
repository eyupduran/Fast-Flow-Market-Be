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
    public class ContactInfoManager:IContactInfoService
    {
        private IContactInfoDal _contactInfoDal;
        public ContactInfoManager(IContactInfoDal contactInfoDal)
        {
            _contactInfoDal = contactInfoDal;
        }

        public IDataResult<ContactInfo> Add(ContactInfo contactInfo)
        {
            //var result = GetById(contactInfo.ContactInfoId);
            //if (result.Data.Country != null)
            //{
            //    Update(contactInfo);
            //    return new SuccessDataResult<ContactInfo>("Contact Info Updated");
            //}
            //else
            //{
                 _contactInfoDal.Add(contactInfo);
                return new SuccessDataResult<ContactInfo>(contactInfo,"Contact Info added");
           // }

        }

        public IResult Delete(ContactInfo contactInfo)
        {
            _contactInfoDal.Delete(contactInfo);
            return new SuccessResult("Contact Info deleted");
        }

        public IDataResult<List<ContactInfo>> GetAll()
        {
            return new SuccessDataResult<List<ContactInfo>>(_contactInfoDal.GetAll(),"Contact Info listed");
        }

        public IDataResult<ContactInfo> GetById(int contactInfoId)
        {
            return new SuccessDataResult<ContactInfo>(_contactInfoDal.Get(c => c.ContactInfoId == contactInfoId));

        }

        public IDataResult<ContactInfo> GetContactInfoByUserId(int userId)
        {
            var result = _contactInfoDal.Get(c => c.UserId == userId);
            return new SuccessDataResult<ContactInfo>(result);
        }

        public IResult Update(ContactInfo contactInfo)
        {
            _contactInfoDal.Update(contactInfo);

            return new SuccessResult();

        }
    }
}
