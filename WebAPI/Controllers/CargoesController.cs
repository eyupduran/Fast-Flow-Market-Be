using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CargoesController : ControllerBase
    {
        private ICargoService _cargoService;

        public CargoesController(ICargoService cargoService)
        {
            _cargoService = cargoService;
        }
        [HttpGet("getallcargoes")]
        public IActionResult GetAll()
        {
            var result = _cargoService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addcargo")]
        public IActionResult Add(Cargo cargo)
        {
            var result = _cargoService.Add(cargo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deletecargo")]
        public IActionResult Delete(Cargo cargo)
        {
            var result = _cargoService.Delete(cargo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updatecargo")]
        public IActionResult Update(Cargo cargo)
        {
            var result = _cargoService.Update(cargo);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbycargoid")]
        public IActionResult GetById(int id)
        {
            var result = _cargoService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
    
}
