import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class DeviceManager {
  List<DeviceDefinition> devices = [];
  void addDevice(DeviceDefinition deviceDefinition) => devices.add(deviceDefinition);
}