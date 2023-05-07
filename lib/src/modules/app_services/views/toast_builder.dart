import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/app_services/services/toaster.dart';

class ToastBuilder extends StatelessWidget {
  final Widget child;

  const ToastBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toasterService = locator<ToasterService>();
    final toaster = locator<Toaster>();
    return StreamBuilder<ToasterState>(
      initialData: toasterService.state,
      stream: toasterService.stream,
      builder: (BuildContext context, AsyncSnapshot<ToasterState> snapshot) {
        if (snapshot.hasData) {
          final dataBuilder = snapshot.data!.builder;
          if (dataBuilder != null) {
            final data = dataBuilder();
            Future.microtask(
              () => toaster.show(
                context,
                text: data.text,
                iconAsset: data.iconAsset,
                isTemporary: data.isTemporary,
              ),
            );
            toasterService.clear();
          } else {
            Future.microtask(() => toaster.dismiss());
          }
        }
        return child;
      },
    );
  }
}
