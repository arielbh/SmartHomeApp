import 'package:flutter/widgets.dart';

abstract class DeviceDefinition {
  String get name;
  IconData get icon;
  List<DeviceModelInfo> get models => [];
  
}

class DeviceModelInfo {
  final String id;
  final String name;

  DeviceModelInfo(this.id, this.name);
}