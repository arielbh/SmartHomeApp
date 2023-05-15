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
        DeviceModelInfo(
            id: "2thermo",
            name: "Amazon Smart Thermostat",
            description:
                "Amazon Smart Thermostat is ENERGY STAR® certified. According to EPA estimates, ENERGY STAR certified thermostats save an average of \$50 on yearly energy bills"),
        DeviceModelInfo(
            id: "3thermo",
            name: "Mysa Smart Thermostat",
            description:
                "The Mysa Smart Thermostat is a programmable thermostat designed specifically for electric heating systems, such as baseboard heaters or electric radiant heating"),
        DeviceModelInfo(
            id: "4thermo",
            name: "Ecobee Smart Thermostat Premium",
            description:
                "The Ecobee Smart Thermostat with Voice Control is a premium smart thermostat designed to provide energy savings, convenience, and enhanced control over your home's heating and cooling system"),
      ];

  @override
  String get operatePath => "thermo/operate";
}
