using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactInfoesController : ControllerBase
    {
        private IContactInfoService _contactInfoService;
        public ContactInfoesController(IContactInfoService contactInfoService)
        {
            _contactInfoService = contactInfoService;
        }

        
        [HttpGet("getallcontactinfoes")]
        public IActionResult GetAll()
        {
            var result = _contactInfoService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addcontactinfo")]
        public IActionResult Add(ContactInfo contactInfo)
        {
            var result = _contactInfoService.Add(contactInfo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deletecontactinfo")]
        public IActionResult Delete(ContactInfo contactInfo)
        {
            var result = _contactInfoService.Delete(contactInfo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updatecontactinfo")]
        public IActionResult Update(ContactInfo contactInfo)
        {
            var result = _contactInfoService.Update(contactInfo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbycontactinfoid")]
        public IActionResult GetById(int contactIdInfoId)
        {
            var result = _contactInfoService.GetById(contactIdInfoId);
            if (result.Success)
            {
                return Ok(result);
            }
            

            return BadRequest(result);
        }

        [HttpGet("getcontactınfobyuserıd")]
        public IActionResult GetContactInfoByUserId(int userId)
        {
            var result = _contactInfoService.GetContactInfoByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }
           

            return BadRequest(result);
        }
    }
}
