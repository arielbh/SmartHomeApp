import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/home/views/layout_widget.dart';

class LayoutRoute extends ModuleRoute {
  LayoutRoute();

  Widget build(BuildContext context, GoRouterState state) {
    return const LayoutWidget();
  }

  String get screenPath => "/layout";

  @override
  bool get isRoot => false;

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
