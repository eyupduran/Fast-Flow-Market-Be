using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BankAccountsController : ControllerBase
    {
        private IBankAccountService _bankAccountService;
        public BankAccountsController(IBankAccountService bankAccountService)
        {
            this._bankAccountService = bankAccountService;
        }

        [HttpGet("getallbankaccounts")]

        public IActionResult GetAll()
        {
            var result = _bankAccountService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("addbankaccount")]
        public IActionResult Add(BankAccount bankAccount)
        {
            var result = _bankAccountService.Add(bankAccount);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("deletebankaccount")]
        public IActionResult Delete(BankAccount bankAccount)
        {
            var result = _bankAccountService.Delete(bankAccount);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("updatebankaccount")]
        public IActionResult Update(BankAccount bankAccount)
        {
            var result = _bankAccountService.Update(bankAccount);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("getbybankaccountid")]
        public IActionResult GetById(int id)
        {
            var result = _bankAccountService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
}

