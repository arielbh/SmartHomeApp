import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:prism_flutter_go_router/prism_flutter_go_router.dart';
import 'package:smart_home_app/src/modules/app_services/app_services_module.dart';
import 'package:smart_home_app/src/modules/database/database_module.dart';
import 'package:smart_home_app/src/modules/device/device_module.dart';
import 'package:smart_home_app/src/modules/home/home_module.dart';
import 'package:smart_home_app/src/modules/products/shade/shade_module.dart';
import 'package:smart_home_app/src/modules/products/thermo/thermo_module.dart';
import 'package:smart_home_app/src/modules/user/routes/welcome_route.dart';
import 'package:smart_home_app/src/modules/user/user_module.dart';
import 'package:smart_home_app/src/shell/shell_widget.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class Bootstrapper extends GoRouterBootstrapper {
  final _coreModules = [
    ModuleInfo((c) => AppServicesModule()),
    ModuleInfo((c) => DatabaseModule()),
    ModuleInfo((c) => UserModule()),
    ModuleInfo((c) => DeviceModule()),
    ModuleInfo((c) => HomeModule()),
  ];

  final _featureModules = [
    ModuleInfo((c) => ThermoModule()),
    ModuleInfo((c) => ShadeModule()),
  ];

  @override
  ModuleCatalog createModuleCatalog() {
    final catalog = MemoryModuleCatalog();
    _coreModules.map((e) => catalog.addModule(e)).toList();
    _featureModules.map((e) => catalog.addModule(e)).toList();
    return catalog;
  }

  @override
  GoRouter createRouter(List<ModuleRoute> routes) {
    final innerRoutes = routes.where((element) => !element.isRoot).map((e) => e.toGoRoute()).toList();
    final rootRoutes = routes.where((element) => element.isRoot).map((e) => e.toGoRoute(_rootNavigatorKey)).toList();

    final goRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: WelcomeRoute().screenPath,
      routes: [
        _routeToTabs(innerRoutes),
        ...rootRoutes,
      ],
      debugLogDiagnostics: false,
    );

    return goRouter;
  }

  ShellRoute _routeToTabs(List<GoRoute> routes) => ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) => createShell(context, state, child),
        routes: routes,
      );

  Widget createShell(BuildContext context, GoRouterState state, Widget child) {
    return ShellWidget(
      title: "Smart Home",
      child: child,
    );
  }
}
