import 'package:get_it/get_it.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';
import 'package:smart_home_app/src/modules/products/thermo/routes/thermo_operate_route.dart';
import 'package:smart_home_app/src/modules/products/thermo/thermo_definition.dart';

class ThermoModule extends GoRouterModule {
  @override
  List<ModuleRoute> configureRoutes() => [ThermoOperateRoute()];

  @override
  Future<void> init(GetIt container) async {
    container<DeviceManager>().addDeviceDefinition(ThermoDefinition());
  }
}
