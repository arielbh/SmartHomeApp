import 'package:get_it/get_it.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';
import 'package:smart_home_app/src/modules/products/shade/shade_definition.dart';

class ShadeModule extends GoRouterModule {
  @override
  List<ModuleRoute> configureRoutes() => [];

  @override
  Future<void> init(GetIt container) async {
    container<DeviceManager>().addDevice(ShadeDefinition());
  }
}
