import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/modules/authcheck/authcheck.dart';

class AuthCheckModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthCheck()),
  ];
}
