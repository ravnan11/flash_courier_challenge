import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/modules/devolution/devolution_controller.dart';
import 'package:login_flash_courier/app/modules/devolution/devolution_page.dart';

class DevolutionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DevolutionController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => DevolutionPage()),
  ];
}
