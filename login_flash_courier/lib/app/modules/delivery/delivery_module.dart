import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/modules/delivery/delivery_controller.dart';
import 'package:login_flash_courier/app/modules/delivery/delivery_page.dart';

class DeliveryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DeliveryController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => DeliveryPage()),
  ];
}
