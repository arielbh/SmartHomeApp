import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/device/views/device_info_screen.dart';

class DeviceInfoRoute extends ModuleRoute {
  DeviceInfoRoute();

  Widget build(BuildContext context, GoRouterState state) {
    return DeviceInfoScreen(
      modelId: state.params["id"]!,
    );
  }

  String get screenPath => "/device/info/:id";

  @override
  bool get isRoot => true;

  @override
  GoRoute toGoRoute([GlobalKey<NavigatorState>? parentNavigatorKey]) {
    return GoRoute(
      path: screenPath,
      name: "device_info",
      pageBuilder: _defaultPageBuilder,
      parentNavigatorKey: parentNavigatorKey,
    );
  }

  Page _defaultPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(child: build(context, state));
  }
}
