import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/modules/splash_screen/splash_screen_page.dart';

class SplashScreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
  ];
}
