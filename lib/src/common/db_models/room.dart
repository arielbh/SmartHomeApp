import 'package:hive/hive.dart';
import 'package:smart_home_app/src/common/interfaces/room_type.dart';

part 'room.g.dart';

@HiveType(typeId: 2)

class Room extends HiveObject {
  Room({required this.type, this.deviceIds = const []});

  @HiveField(0)
  int type;

  @HiveField(1)
  List<String> deviceIds;

  RoomType get roomType => RoomType.values[type];
}