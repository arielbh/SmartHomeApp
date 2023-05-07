import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/common/region_names.dart';
import 'package:smart_home_app/src/modules/app_services/views/toast_builder.dart';

class ShellWidget extends StatelessWidget {
  final Widget child;
  final String? title;

  const ShellWidget({
    required this.child,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToastBuilder(
      
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
    
          title: title != null ? Text(title!, style: Theme.of(context).textTheme.headlineSmall) : null,
        ),
        body: child,
        floatingActionButton: locator<GoRouter>().location == "/layout"
            ? RegionBuilder(
                regionManager: locator<RegionManager>(),
                regionName: RegionNames.actionArea.name,
                singleChild: (widget) => widget,
              )
            : null,
      ),
    );
  }
}
