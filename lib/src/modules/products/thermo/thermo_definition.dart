import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class ThermoDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.hot_tub;

  @override
  String get name => "Thermostat";

  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo(
            id: "1thermo",
            name: "Google Nest Learning Thermostat",
            description:
                '''The Google Nest Learning Thermostat is a smart thermostat that uses machine learning algorithms to help users save energy and reduce their heating and cooling costs.'''),
        DeviceModelInfo(id: "2thermo", name: "Amazon Smart Thermostat"),
        DeviceModelInfo(id: "3thermo", name: "Mysa Smart Thermostat"),
        DeviceModelInfo(id: "4thermo", name: "Ecobee Smart Thermostat Premium"),
      ];
}
