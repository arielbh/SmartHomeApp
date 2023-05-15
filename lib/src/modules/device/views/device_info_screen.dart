import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_flutter_core/prism_flutter_core.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/common/events/device_added_event.dart';
import 'package:smart_home_app/src/common/interfaces/room_type.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

class DeviceInfoScreen extends StatelessWidget {
  final String modelId;
  const DeviceInfoScreen({
    Key? key,
    required this.modelId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final device = locator<DeviceManager>().getById(modelId);

    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () => Router.neglect(context, () => context.pop()),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/generic.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
              child: Text(device.description, style: Theme.of(context).textTheme.headlineSmall),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) => _InstallSheet(
                        deviceId: modelId,
                      ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.install_mobile),
                      SizedBox(width: 5.0),
                      Text("Install"),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _InstallSheet extends StatefulWidget {
  final String deviceId;

  const _InstallSheet({super.key, required this.deviceId});
  @override
  State<_InstallSheet> createState() => _InstallSheetState();
}

class _InstallSheetState extends State<_InstallSheet> {
  RoomType? _roomType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          const SizedBox(height: 12.0),
          Text(
            "Install device into room",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          DropdownButton<RoomType>(
            focusColor: Colors.white,
            value: _roomType,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (RoomType? value) {
              setState(() {
                _roomType = value!;
              });
            },
            items: RoomType.values.map<DropdownMenuItem<RoomType>>((RoomType value) {
              return DropdownMenuItem<RoomType>(
                value: value,
                child: Row(
                  children: [
                    Icon(
                      value.icon,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 5.0),
                    Text(value.name),
                  ],
                ),
              );
            }).toList(),
          ),
          ElevatedButton(
              onPressed: _roomType != null
                  ? () {
                      locator<EventAggregator>().getEvent<DeviceAddedEvent>()?.publish(widget.deviceId);
                      locator<HomeService>().addDevice(widget.deviceId, _roomType!);
                      Navigator.pop(context);
                      locator<GoRouter>().go("/layout");
                    }
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.install_mobile),
                    SizedBox(width: 5.0),
                    Text("Install"),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
