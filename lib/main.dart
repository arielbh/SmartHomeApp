import 'package:flutter/material.dart';
import 'package:smart_home_app/src/app.dart';
import 'package:smart_home_app/src/bootstrapper.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';

void main() async {
  final boostrapper = Bootstrapper();
  await boostrapper.run();
  locator = boostrapper.container;

  runApp(const App());
}
