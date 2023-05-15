import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';

class FloatingAddDeviceWidget extends StatelessWidget {
  const FloatingAddDeviceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Row(
        children: const [
          SizedBox(
            width: 5,
          ),
          Icon(Icons.add),
          Icon(Icons.developer_board),
        ],
      ),
      onPressed: () {
        locator<GoRouter>().push("/device/add");
      },
    );
  }
}
