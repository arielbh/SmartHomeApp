import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class DeviceManager {
  List<DeviceDefinition> definitions = [];
  void addDeviceDefinition(DeviceDefinition deviceDefinition) => definitions.add(deviceDefinition);

  DeviceModelInfo getById(String modelId) {
    return definitions.expand((element) => element.models).firstWhere((m) => m.id == modelId);
  }
  DeviceDefinition getDefinition(String modelId) {
    return definitions.firstWhere((element) => element.models.any((m) => m.id == modelId));
  }

}
