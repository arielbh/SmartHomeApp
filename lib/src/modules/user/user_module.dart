import 'package:get_it/get_it.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/modules/user/routes/welcome_route.dart';

class UserModule extends GoRouterModule {
  UserModule();

  @override
  List<ModuleRoute> configureRoutes() {
    return [
      WelcomeRoute(),
    ];
  }

  @override
  Future<void> init(GetIt container) async {}
}
