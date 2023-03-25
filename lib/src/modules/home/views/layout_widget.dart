import 'package:flutter/material.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/common/region_names.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.lightBlue.withOpacity(0.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegionBuilder(
                regionManager: locator<RegionManager>(),
                regionName: RegionNames.topBarLeft.name,
                multiChild: (children) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...children,
                  ],
                ),
              ),
              RegionBuilder(
                regionManager: locator<RegionManager>(),
                regionName: RegionNames.topBarRight.name,
                multiChild: (children) => Row(
                  children: [
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            RegionBuilder(
              regionManager: locator<RegionManager>(),
              regionName: RegionNames.mainLeft.name,
              singleChild: (child) => child,
            ),
            Expanded(
              child: RegionBuilder(
                regionManager: locator<RegionManager>(),
                regionName: RegionNames.mainCenter.name,
                singleChild: (child) => child,
              ),
            ),
            RegionBuilder(
              regionManager: locator<RegionManager>(),
              regionName: RegionNames.mainRight.name,
              singleChild: (child) => child,
            ),
          ],
        ))
      ],
    );
  }
}
