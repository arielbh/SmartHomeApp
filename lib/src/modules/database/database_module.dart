import 'package:get_it/get_it.dart';
import 'package:prism_flutter_getit/prism_flutter_getit.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

class DatabaseModule extends GetItModule {
  @override
  Future<void> init(GetIt container) async {
    final database = DatabaseService();
    await database.init();
    container.registerSingleton(database);
  }

  @override
  List<ModuleRoute> configureRoutes() => [];
}
