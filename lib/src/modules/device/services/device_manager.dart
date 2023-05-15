import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class DeviceManager {
  List<DeviceDefinition> definitions = [SimpleDeviceDefinition()];
  void addDeviceDefinition(DeviceDefinition deviceDefinition) => definitions.add(deviceDefinition);

  DeviceModelInfo getById(String modelId) {
    return definitions.expand((element) => element.models).firstWhere((m) => m.id == modelId);
  }

  DeviceDefinition getDefinition(String modelId) {
    return definitions.firstWhere((element) => element.models.any((m) => m.id == modelId));
  }
}

class SimpleDeviceDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.home;

  @override
  String get name => "Simple Device";

  @override
  String get operatePath => "simple/operate";
  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo(
          id: "1",
          name: "Simple Device",
          description: "Simple Device Description",
        )
      ];
}
