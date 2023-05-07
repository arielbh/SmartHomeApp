import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/products/thermo/views/thermo_operate_widget.dart';

class ThermoOperateRoute extends ModuleRoute {
  ThermoOperateRoute();

  Widget build(BuildContext context, GoRouterState state) {
    return ThermoOperateWidget(
      deviceId: state.params["deviceId"]!,
    );
  }

  String get screenPath => "/product/thermo/operate/:deviceId";

  @override
  bool get isRoot => true;

  @override
  GoRoute toGoRoute([GlobalKey<NavigatorState>? parentNavigatorKey]) {
    return GoRoute(
      path: screenPath,
      name: "thermo/operate",
      pageBuilder: _defaultPageBuilder,
      parentNavigatorKey: parentNavigatorKey,
    );
  }

  Page _defaultPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(child: build(context, state));
  }
}
