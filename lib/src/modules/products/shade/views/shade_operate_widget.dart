import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';

class ShadeOperateWidget extends StatefulWidget {
  final String deviceId;
  const ShadeOperateWidget({
    super.key,
    required this.deviceId,
  });

  @override
  State<ShadeOperateWidget> createState() => _ShadeOperateWidgetState();
}

class _ShadeOperateWidgetState extends State<ShadeOperateWidget> {
  int level = 20;

  String _statusByLevel(int level) {
    if (level == 0) return "Closed";
    if (level == 100) return "Open";
    return "Partially Open";
  }

  int increaseLevel(int current) {
    return min(100, current + 10);
  }

  int decreaseLevel(int current) {
    return max(0, current - 10);
  }

  @override
  Widget build(BuildContext context) {
    final device = locator<DeviceManager>().getById(widget.deviceId);
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () => Router.neglect(context, () => context.pop()),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/shade.png'),
            Container(color: Colors.white.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child:
                          Text("Current: ${_statusByLevel(level)}", style: Theme.of(context).textTheme.headlineSmall)),
                  Center(child: Text("Device: $level", style: Theme.of(context).textTheme.headlineSmall)),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        level = increaseLevel(level);
                      });
                    },
                    style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.arrow_upward),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        level = decreaseLevel(level);
                      });
                    },
                    style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
