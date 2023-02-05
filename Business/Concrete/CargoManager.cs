using Business.Abstract;
using Core.Utilities.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Concrete
{
    public class CargoManager:ICargoService
    {
        private ICargoDal _cargoDal;
        public CargoManager(ICargoDal cargoDal)
        {
            _cargoDal = cargoDal;
        }

        public IResult Add(Cargo cargo)
        {
            _cargoDal.Add(cargo);
            return new SuccessResult("Cargo added");
        }

        public IResult Delete(Cargo cargo)
        {
            _cargoDal.Delete(cargo);
            return new SuccessResult("Cargo deleted");
        }

        public IDataResult<List<Cargo>> GetAll()
        {
            return new SuccessDataResult<List<Cargo>>(_cargoDal.GetAll(), "Cargoes listed");
        }

        public IDataResult<Cargo> GetById(int cargoId)
        {
            return new SuccessDataResult<Cargo>(_cargoDal.Get(c => c.CargoId == cargoId));

        }
        public IResult Update(Cargo cargo)
        {
            _cargoDal.Update(cargo);

            return new SuccessResult();

        }
    }
}
