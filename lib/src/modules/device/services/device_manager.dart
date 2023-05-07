import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class DeviceManager {
  List<DeviceDefinition> devices = [];
  void addDevice(DeviceDefinition deviceDefinition) => devices.add(deviceDefinition);

  DeviceModelInfo getById(String modelId) {
    return devices.expand((element) => element.models).firstWhere((m) => m.id == modelId);
  }
}
