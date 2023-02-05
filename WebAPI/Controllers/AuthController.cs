using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Abstract;
using Core.Entities.Concrete;
using Core.Utilities.Results;
using Entities.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {
        private IAuthService _authService;
        private IUserService _userService;

        public AuthController(IAuthService authService,IUserService userService)
        {
            _authService = authService;
            _userService = userService;
        }

        //[HttpPost("login")]
        //public ActionResult Login(UserForLoginDto userForLoginDto)
        //{
        //    var userToLogin = _authService.Login(userForLoginDto);
        //    if (!userToLogin.Success)
        //    {
        //        return BadRequest(userToLogin);
        //    }

        //    var tokenResult = _authService.CreateAccessToken(userToLogin.Data);
        //    if (!tokenResult.Success)
        //    {
        //        return BadRequest(tokenResult);
        //    }

        //    var operationClaims = _authService.GetUserOperationClaims(new User { Id = userToLogin.Data.Id });

        //    AuthDto authDto = new AuthDto
        //    {
        //        UserId = userToLogin.Data.Id,
        //        FirstName = userToLogin.Data.FirstName,
        //        LastName = userToLogin.Data.LastName,
        //        Token = tokenResult.Data.Token,
        //        Expiration = tokenResult.Data.Expiration,
        //        OperationClaims = operationClaims,
        //        UserType = userToLogin.Data.UserType,
        //        Email = userToLogin.Data.Email
        //    };
        //    var result = new SuccessDataResult<AuthDto>(authDto, userToLogin.Message);
        //    return Ok(result);
        //}

        [HttpPost("login")]
        public ActionResult Login(UserForLoginDto userForLoginDto)
        {
            var userToLogin = _authService.Login(userForLoginDto);
            if (!userToLogin.Success)
            {
                return BadRequest(userToLogin.Message);
            }

            var result = _authService.CreateAccessToken(userToLogin.Data);
            if (result.Success)
            {
                return Ok(result.Data);
            }

            return BadRequest(result.Message);
        }

        [HttpPost("register")]
        public ActionResult Register(UserForRegisterDto userForRegisterDto)
        {
            var userExists = _authService.UserExists(userForRegisterDto.Email);
            if (!userExists.Success)
            {
                return BadRequest(userExists);
            }

            var registerResult = _authService.Register(userForRegisterDto, userForRegisterDto.Password);
            var tokenResult = _authService.CreateAccessToken(registerResult.Data);
            if (!tokenResult.Success)
            {
                return BadRequest(tokenResult);
            }
            var loginDto = new UserForLoginDto
            {
                Email = userForRegisterDto.Email,
                Password = userForRegisterDto.Password
            };
            var userToLogin = _authService.Login(loginDto).Data.Id;
            AuthDto authDto = new AuthDto
            {
                UserId = userToLogin,
                FirstName = registerResult.Data.FirstName,
                LastName = registerResult.Data.LastName,
                Token = tokenResult.Data.Token,
                Expiration = tokenResult.Data.Expiration,
                UserType = registerResult.Data.UserType

            };
            var result = new SuccessDataResult<AuthDto>(authDto, registerResult.Message);
            return Ok(result);
        }


        [HttpGet("getuserdetailbyuserıd")]
        public IActionResult GetUserDetailByUserId(int userId)
        {
            var result = _userService.GetUserDetailByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
}