import 'package:get_it/get_it.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/common/region_names.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';
import 'package:smart_home_app/src/modules/home/routes/home_edit_route.dart';
import 'package:smart_home_app/src/modules/home/routes/layout_route.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';
import 'package:smart_home_app/src/modules/home/views/home_selection_widget.dart';
import 'package:smart_home_app/src/modules/home/views/rooms_widget.dart';

class HomeModule extends GoRouterModule {
  HomeModule();

  @override
  List<ModuleRoute> configureRoutes() {
    return [
      LayoutRoute(),
      HomeEditRoute(),
    ];
  }

  @override
  Future<void> init(GetIt container) async {
    final database = container<DatabaseService>();
    await database.registerSchema<Home>(HomeAdapter());
    container.registerLazySingleton(() => HomeService(database: database));
    final regionManager = container<RegionManager>();
    regionManager.registerView(
      RegionNames.topBarLeft.name,
      RegionWidgetRegistration(
        metadata: MultiChildMetadata("homeSelection"),
        registration: (context) => const HomeSelectionWidget(),
      ),
    );
  }
}
