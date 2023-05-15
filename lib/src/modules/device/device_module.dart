import 'package:get_it/get_it.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/common/region_names.dart';
import 'package:smart_home_app/src/modules/device/routes/add_device_route.dart';
import 'package:smart_home_app/src/modules/device/routes/device_info_route.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';
import 'package:smart_home_app/src/modules/device/views/floating_add_device_widget.dart';

class DeviceModule extends GoRouterModule {
  @override
  List<ModuleRoute> configureRoutes() {
    return [
      AddDeviceRoute(),
      DeviceInfoRoute(),
    ];
  }

  @override
  Future<void> init(GetIt container) async {
    container.registerLazySingleton(() => DeviceManager());
    final regionManager = container<RegionManager>();
    regionManager.registerView(
      RegionNames.actionArea.name,
      RegionWidgetRegistration(
        metadata: RegionMetadata("addDevice"),
        registration: (context) => const FloatingAddDeviceWidget(),
      ),
    );
  }
}
