using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.InteropServices;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderStatuesController : ControllerBase
    {
        private IOrderStatusService _orderStatusService;

        public OrderStatuesController(IOrderStatusService orderStatusService)
        {
            _orderStatusService = orderStatusService;
        }

        [HttpGet("getallorderstatus")]
        public IActionResult GetAll()
        {
            var result = _orderStatusService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addorderstatus")]
        public IActionResult Add(OrderStatus orderStatus)
        {
            var result = _orderStatusService.Add(orderStatus);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deleteorderstatus")]
        public IActionResult Delete(OrderStatus orderStatus)
        {
            var result = _orderStatusService.Delete(orderStatus);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updateorderstatus")]
        public IActionResult Update(OrderStatus orderStatus)
        {
            var result = _orderStatusService.Update(orderStatus);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbyorderstatusid")]
        public IActionResult GetById(int id)
        {
            var result = _orderStatusService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
}
