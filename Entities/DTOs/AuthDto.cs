using Core.Entities;
using Core.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.DTOs
{
    public class AuthDto:IDto
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserType { get; set; }
        public string Email { get; set; }

        public string Token { get; set; }
        public DateTime Expiration { get; set; }
        public List<OperationClaim> OperationClaims { get; set; }

    }
}
