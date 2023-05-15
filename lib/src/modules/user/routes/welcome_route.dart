import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_go_router/interfaces/module_route.dart';
import 'package:smart_home_app/src/modules/user/views/welcome_widget.dart';

class WelcomeRoute extends ModuleRoute {
  WelcomeRoute();

  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomeWidget();
  }

  String get screenPath => "/welcome";

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
