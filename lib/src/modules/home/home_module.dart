import 'package:get_it/get_it.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/modules/home/routes/layout_route.dart';

class HomeModule extends GoRouterModule {
  HomeModule();

  @override
  List<ModuleRoute> configureRoutes() {
    return [
      LayoutRoute(),
    ];
  }

  @override
  Future<void> init(GetIt container) async {}
}
