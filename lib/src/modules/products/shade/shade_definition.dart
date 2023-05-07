import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class ShadeDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.sailing;

  @override
  String get name => "Shade";
  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo(id: "1shade", name: "Lutron Serena Shades"),
        DeviceModelInfo(id: "2shade", name: "SmarterHome MySmartRollerShades"),
        DeviceModelInfo(id: "3shade", name: "Graber Motorized Shades"),
        DeviceModelInfo(id: "4shade", name: "IKEA Fyrtur"),
      ];

  @override
  String get operatePath => "shade/operate";
}
