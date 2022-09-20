import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/core/data/http/http.dart';
import 'package:login_flash_courier/app/modules/delivery/delivery_module.dart';
import 'package:login_flash_courier/app/modules/devolution/devolution_controller.dart';
import 'package:login_flash_courier/app/modules/devolution/devolution_module.dart';
import 'package:login_flash_courier/app/modules/home/home_controller.dart';
import 'package:login_flash_courier/app/modules/home/home_module.dart';
import 'package:login_flash_courier/app/modules/login/login_controller.dart';
import 'package:login_flash_courier/app/modules/login/login_module.dart';
import 'package:login_flash_courier/app/modules/login/login_repository.dart';
import 'package:login_flash_courier/app/modules/splash_screen/splash_screen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => LoginController(
        LoginRepositoryImp(
          HttpClientImp(),
        ),
      ),
    ),
    Bind.lazySingleton(
      (i) => HomeController(),
    ),
    Bind.lazySingleton(
      (i) => DevolutionController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/devolution/', module: DevolutionModule()),
    ModuleRoute('/delivery/', module: DeliveryModule()),
  ];
}
