import 'package:get_it/get_it.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/common/db_models/room.dart';
import 'package:smart_home_app/src/common/region_names.dart';
import 'package:smart_home_app/src/modules/app_services/services/shared_preferences_service.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';
import 'package:smart_home_app/src/modules/home/routes/layout_route.dart';
import 'package:smart_home_app/src/modules/home/services/home_accessor.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';
import 'package:smart_home_app/src/modules/home/views/rooms_widget.dart';

class HomeModule extends GoRouterModule {
  HomeModule();

  @override
  List<ModuleRoute> configureRoutes() {
    return [
      LayoutRoute(),
      // HomeEditRoute(),
    ];
  }

  @override
  Future<void> init(GetIt container) async {
    final database = container<DatabaseService>();
    await database.registerSchema<Home>(HomeAdapter());
    await database.registerSchema<Room>(RoomAdapter());
    final accessor = HomeAccessor(database: database);
    container.registerLazySingleton(() => HomeService(
          accessor: accessor,
          localStorageService: container<LocalStorageService>(),
        ));
    final regionManager = container<RegionManager>();
    regionManager.registerView(
      RegionNames.main.name,
      RegionWidgetRegistration(
        metadata: RegionMetadata("rooms"),
        registration: (context) => const RoomsWidget(),
      ),
    );
  }
}
