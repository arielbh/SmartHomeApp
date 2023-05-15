import 'package:flutter/material.dart';
import 'package:smart_home_app/src/common/interfaces/device_definition.dart';

class ShadeDefinition extends DeviceDefinition {
  @override
  IconData get icon => Icons.sailing;

  @override
  String get name => "Shade";
  @override
  List<DeviceModelInfo> get models => [
        DeviceModelInfo(
            id: "1shade",
            name: "Lutron Serena Shades",
            description:
                "Lutron Serena Shades are a line of motorized window shades designed to provide convenient and customizable control over natural light in your home or office."),
        DeviceModelInfo(
            id: "2shade",
            name: "SmarterHome MySmartRollerShades",
            description:
                "SmarterHome MySmartRollerShades are a line of motorized window shades designed to provide convenient and customizable control over natural light in your home or office"),
        DeviceModelInfo(
            id: "3shade",
            name: "Graber Motorized Shades",
            description:
                "Graber Motorized Shades are a line of motorized window shades designed to provide convenient and customizable control over natural light in your home or office"),
        DeviceModelInfo(
            id: "4shade",
            name: "IKEA Fyrtur",
            description:
                "IKEA Fyrtur is a line of motorized window blinds designed to provide convenient and customizable control over natural light in your home or office"),
      ];

  @override
  String get operatePath => "shade/operate";
}
