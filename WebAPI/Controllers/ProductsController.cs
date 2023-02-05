using System.Threading;
using Business.Abstract;
using Entities.Concrete;
using Entities.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private IProductService _productService;

        public ProductsController(IProductService productService)
        {
            _productService = productService;
        }

        [HttpGet("getallProduct")]
        public IActionResult GetAll()
        {
            var result = _productService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbyproductid")]
        public IActionResult GetById(int id)
        {
            var result = _productService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("Getallproductdetailbycategoryıd")]
        public IActionResult GetAllProductDetailByCategoryId(int categoryId)
        {
            var result = _productService.GetAllProductDetailByCategoryId(categoryId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addproduct")]
        public IActionResult Add(Product product)
        {
            var result = _productService.Add(product);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deleteproduct")]
        public IActionResult Delete(Product product)
        {
            var result = _productService.Delete(product);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updateproduct")]
        public IActionResult Update(Product product)
        {
            var result = _productService.Update(product);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
        

        [HttpGet("getallproductdetails")]
        public IActionResult GetAllProductDetails()
        {
            var result = _productService.GetAllProductDetails();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getproductsalebyuserıd")]
        public IActionResult GetProductSaleByUserId(int userId)
        {
            var result = _productService.GetProductSaleByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addproductdetails")]
        public IActionResult AddProductDetail(ProductDetailDto productDetailDto)
        {
            var result = _productService.AddProductDetail(productDetailDto);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
        //GetProductDetailByProductId

        [HttpGet("Getproductdetailbypoductıd")]
        public IActionResult GetProductDetailByProductId(int productId)
        {
            var result = _productService.GetProductDetailByProductId(productId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
        //GetProductsByUserId


        [HttpGet("getproductsbyuserıd")]
        public IActionResult GetProductsByUserId(int userId)
        {
            var result = _productService.GetProductsByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
}
