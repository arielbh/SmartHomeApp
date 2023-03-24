import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = locator<GoRouter>();
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate);
  }
}
