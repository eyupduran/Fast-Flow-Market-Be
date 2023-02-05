using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShoppingCartsController : ControllerBase
    {
        private IShoppingCartService _shoppingCartService;
        public ShoppingCartsController(IShoppingCartService shoppingCartService)
        {
            _shoppingCartService = shoppingCartService;
        }

        [HttpGet("getallshoppingcart")]
        public IActionResult GetAll()
        {
            var result = _shoppingCartService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addshoppingcart")]
        public IActionResult Add(ShoppingCart shoppingCart)
        {
            var result = _shoppingCartService.Add(shoppingCart);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deleteshoppingcart")]
        public IActionResult Delete(ShoppingCart shoppingCart)
        {
            var result = _shoppingCartService.Delete(shoppingCart);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updateshoppingcart")]
        public IActionResult Update(ShoppingCart shoppingCart)
        {
            var result = _shoppingCartService.Update(shoppingCart);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbyshoppingcartid")]
        public IActionResult GetById(int id)
        {
            var result = _shoppingCartService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getshoppingcartdetailbyuserıdandaproductıd")]
        public IActionResult GetShoppingCartDetailByUserIdAndProductId(int userId,int productId)
        {
            var result = _shoppingCartService.GetShoppingCartDetailByUserIdAndProductId(userId,productId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
        

        [HttpGet("getshoppingcartproductdetailbyuserıd")]
        public IActionResult GetShoppingCartProductsDetailByUserId(int userId)
        {
            var result = _shoppingCartService.GetShoppingCartProductsDetailByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getshoppingcartproductandquantitydetailbyuserıd")]
        public IActionResult GetShoppingCartProductAndQuantityDetailByUserId(int userId)
        {
            var result = _shoppingCartService.GetShoppingCartProductAndQuantityDetailByUserId(userId);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }


    }
}
