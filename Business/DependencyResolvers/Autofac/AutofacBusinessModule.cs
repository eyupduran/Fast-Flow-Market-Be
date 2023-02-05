using Autofac;
using Autofac.Extras.DynamicProxy;
using Business.Abstract;
using Business.Concrete;
using Castle.DynamicProxy;
using Core.Utilities.Interceptors;
using Core.Utilities.Security.JWT;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;

namespace Business.DependencyResolvers.Autofac
{
    public class AutofacBusinessModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ProductManager>().As<IProductService>().SingleInstance();
            builder.RegisterType<EfProductDal>().As<IProductDal>().SingleInstance();


            builder.RegisterType<CategoryManager>().As<ICategoryService>().SingleInstance();
            builder.RegisterType<EfCategoryDal>().As<ICategoryDal>().SingleInstance();


            builder.RegisterType<OrderStatusManager>().As<IOrderStatusService>().SingleInstance();
            builder.RegisterType<EfOrderStatusDal>().As<IOrderStatusDal>().SingleInstance();

            builder.RegisterType<BankAccountManager>().As<IBankAccountService>().SingleInstance();
            builder.RegisterType<EfBankAccountDal>().As<IBankAccountDal>().SingleInstance();

  

            builder.RegisterType<CargoManager>().As<ICargoService>().SingleInstance();
            builder.RegisterType<EfCargoDal>().As<ICargoDal>().SingleInstance();



            builder.RegisterType<ContactInfoManager>().As<IContactInfoService>().SingleInstance();
            builder.RegisterType<EfContactInfoDal>().As<IContactInfoDal>().SingleInstance();

            builder.RegisterType<OrderManager>().As<IOrderService>().SingleInstance();
            builder.RegisterType<EfOrderDal>().As<IOrderDal>().SingleInstance();



            builder.RegisterType<ShoppingCartManager>().As<IShoppingCartService>().SingleInstance();
            builder.RegisterType<EfShoppingCartDal>().As<IShoppingCartDal>().SingleInstance();

            builder.RegisterType<ProductImageManager>().As<IProductImageService>().SingleInstance();
            builder.RegisterType<EfProductImageDal>().As<IProductImageDal>().SingleInstance();



            builder.RegisterType<UserManager>().As<IUserService>();
            builder.RegisterType<EfUserDal>().As<IUserDal>();

            builder.RegisterType<AuthManager>().As<IAuthService>();
            builder.RegisterType<JwtHelper>().As<ITokenHelper>();


            var assembly = System.Reflection.Assembly.GetExecutingAssembly();

            builder.RegisterAssemblyTypes(assembly).AsImplementedInterfaces()
                .EnableInterfaceInterceptors(new ProxyGenerationOptions()
                {
                    Selector = new AspectInterceptorSelector()
                }).SingleInstance();
        }
    }
}