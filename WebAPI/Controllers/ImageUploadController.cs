using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageUploadController : ControllerBase
    {
        IProductImageService _ımageService;
        public ImageUploadController(IProductImageService ımageService)
        {
            _ımageService = ımageService;
        }
        [HttpGet("getall")]
        public IActionResult Get()
        {
            var result = _ımageService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("add")]
        public IActionResult Add([FromForm(Name = ("Image"))] IFormFile file, [FromForm] ProductImage usProduct)
        {
            var result = _ımageService.Add(file,usProduct);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpDelete("delete")]
        public IActionResult Delete(ProductImage carImage)
        {
            var result = _ımageService.Delete(carImage);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpPut("update")]
        public IActionResult Update([FromForm(Name = ("Image"))] IFormFile file, [FromForm] ProductImage usProductImage)
        {
            var result = _ımageService.Update(file, usProductImage);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }


    }
}
