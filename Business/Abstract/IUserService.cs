using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities.Concrete;
using Core.Utilities.Results;
using Entities.Concrete;
using Entities.DTOs;

namespace Business.Abstract
{
    public interface IUserService
    {
        List<OperationClaim> GetClaims(int userId);
        void Add(User user);
        User GetByMail(string email);

        DataResult<UserDetailDto> GetUserDetailByUserId(int userId);

    }
}