using Core.Utilities.Results;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public interface ICargoService
    {
        IDataResult<List<Cargo>> GetAll();
        IResult Add(Cargo cargo);
        IResult Delete(Cargo cargo);
        IResult Update(Cargo cargo);
        IDataResult<Cargo> GetById(int cargoId);
    }
}
