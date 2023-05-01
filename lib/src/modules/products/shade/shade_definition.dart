import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class ShadeDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.sailing;

  @override
  String get name => "Shade";
  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo("1", "Lutron Serena Shades"),
        DeviceModelInfo("2", "SmarterHome MySmartRollerShades"),
        DeviceModelInfo("3", "Graber Motorized Shades"),
        DeviceModelInfo("4", "IKEA Fyrtur"),
      ];
}
