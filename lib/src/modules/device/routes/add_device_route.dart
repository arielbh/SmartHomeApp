import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/device/views/add_device_screen.dart';

class AddDeviceRoute extends ModuleRoute {
  AddDeviceRoute();

  Widget build(BuildContext context, GoRouterState state) {
    return const AddDeviceScreen();
    // return BlocProvider(
    //   create: (context) => HomeEditBloc(
    //     homeService: locator<HomeService>(),
    //     database: locator<DatabaseService>(),
    //     key: state.extra,
    //   ),
    //   child: HomeEditWidget(),
    // );
  }

  String get screenPath => "/device/add";

  @override
  bool get isRoot => true;

  @override
  GoRoute toGoRoute([GlobalKey<NavigatorState>? parentNavigatorKey]) {
    return GoRoute(
      path: screenPath,
      pageBuilder: _defaultPageBuilder,
      parentNavigatorKey: parentNavigatorKey,
    );
  }

  Page _defaultPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(child: build(context, state));
  }
}
