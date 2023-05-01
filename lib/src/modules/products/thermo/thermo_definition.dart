import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class ThermoDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.hot_tub;

  @override
  String get name => "Thermostat";

  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo("1", "Google Nest Learning Thermostat"),
        DeviceModelInfo("2", "Amazon Smart Thermostat"),
        DeviceModelInfo("3", "Mysa Smart Thermostat"),
        DeviceModelInfo("4", "Ecobee Smart Thermostat Premium"),
      ];
}
