import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';

class ThermoOperateWidget extends StatefulWidget {
  final String deviceId;
  const ThermoOperateWidget({
    super.key,
    required this.deviceId,
  });

  @override
  State<ThermoOperateWidget> createState() => _ThermoOperateWidgetState();
}

class _ThermoOperateWidgetState extends State<ThermoOperateWidget> {
  int temperature = 25;
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
            Image.asset('assets/images/generic.png'),
            Container(color: Colors.white.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text("Current Temp: 25°", style: Theme.of(context).textTheme.headlineSmall)),
                  Center(child: Text("Device: $temperature°", style: Theme.of(context).textTheme.headlineSmall)),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperature++;
                      });
                    },
                    style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.arrow_upward),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperature--;
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
