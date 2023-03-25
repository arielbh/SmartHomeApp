import 'package:hive/hive.dart';

part 'home.g.dart';

@HiveType(typeId: 1)

class Home extends HiveObject {
  Home({required this.name});

  @HiveField(0)
  String name;

  //List<Rome>? rooms;
}
// enum RoomType {
//   draft,
//   pending,
//   sent,
// }
// @embedded
// class Rome {

//   //List<Device>? devices;

// }

// @embedded
// class Device {

// }