import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';
import 'package:smart_home_app/src/modules/device/services/device_manager.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devices = locator<DeviceManager>().devices;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Device"),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () => Router.neglect(context, () => context.pop()),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => _DeviceItem(
          definition: devices[index],
          onPressed: (definition, model) {},
        ),
        // separatorBuilder: (context, index) => const Divider(),
        itemCount: devices.length,
      ),
    );
  }
}

class _DeviceItem extends StatelessWidget {
  final DeviceDefinition definition;
  final Function(DeviceDefinition, DeviceModelInfo) onPressed;
  const _DeviceItem({
    super.key,
    required this.definition,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(definition.icon),
      title: Text(definition.name, style: Theme.of(context).textTheme.titleLarge),
      children: definition.models
          .map((e) => ListTile(
                title: Text(e.name),
                onTap: () => onPressed(definition, e),
              ))
          .toList(),
    );
  }
}
