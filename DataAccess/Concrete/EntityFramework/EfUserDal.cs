using Core.DataAcess.EntityFramework;
using Core.Entities.Concrete;
using DataAccess.Abstract;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Xml.Linq;


namespace DataAccess.Concrete.EntityFramework
{
    public class EfUserDal : EfEntityRepositoryBase<User, ETradeContext>, IUserDal
    {
        public List<OperationClaim> GetClaims(int userId)
        {
            using (var context = new ETradeContext())
            {
                var result = from operationClaim in context.OperationClaims
                             join userOperationClaim in context.UserOperationClaims
                                 on operationClaim.Id equals userOperationClaim.OperationClaimId
                             where userOperationClaim.UserId == userId
                             select new OperationClaim { Id = operationClaim.Id, Name = operationClaim.Name };

                return result.ToList();
            }
        }

        public UserDetailDto GetUserDetailByUserId(int userId)
        {
            using (var context = new ETradeContext())
            {
                var result = from u in context.Users 
                             join uo in context.UserOperationClaims on u.Id equals uo.UserId
                             join op in context.OperationClaims on uo.OperationClaimId equals op.Id
                             where u.Id == userId
                             select new UserDetailDto {
                                      UserId=u.Id ,
                                      FirstName =u.FirstName,
                                      LastName =u.LastName,
                                      Email =u.Email,
                                      UserType =u.UserType,
                                      OperationClaims = GetClaims(userId)
                             };

                return result.SingleOrDefault();
            }
        }
    }
}
