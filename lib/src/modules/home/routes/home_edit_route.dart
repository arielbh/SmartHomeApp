// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:prism_flutter_go_router/interfaces/module_route.dart';
// import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
// import 'package:smart_home_app/src/modules/database/services/database_service.dart';
// import 'package:smart_home_app/src/modules/home/bloc/home_edit_bloc.dart';
// import 'package:smart_home_app/src/modules/home/services/home_service.dart';
// import 'package:smart_home_app/src/modules/home/views/home_edit_widget.dart';

// class HomeEditRoute extends ModuleRoute {
//   HomeEditRoute();

//   Widget build(BuildContext context, GoRouterState state) {
//     return BlocProvider(
//       create: (context) => HomeEditBloc(
//         homeService: locator<HomeService>(),
//         database: locator<DatabaseService>(),
//         key: state.extra,
//       ),
//       child: HomeEditWidget(),
//     );
//   }

//   String get screenPath => "/home/edit";

//   @override
//   bool get isRoot => false;

//   @override
//   GoRoute toGoRoute([GlobalKey<NavigatorState>? parentNavigatorKey]) {
//     return GoRoute(
//       path: screenPath,
//       pageBuilder: _defaultPageBuilder,
//       parentNavigatorKey: parentNavigatorKey,
//     );
//   }

//   Page _defaultPageBuilder(BuildContext context, GoRouterState state) {
//     return MaterialPage(child: build(context, state));
//   }
// }
