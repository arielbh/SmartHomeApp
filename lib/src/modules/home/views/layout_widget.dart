import 'package:flutter/material.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/common/region_names.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RegionBuilder(
      regionManager: locator<RegionManager>(),
      regionName: RegionNames.main.name,
      singleChild: (child) => child,
    );
  }
}
