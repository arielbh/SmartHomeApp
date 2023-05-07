import 'package:hive/hive.dart';

part 'room.g.dart';

@HiveType(typeId: 2)
class Room extends HiveObject {
  Room({required this.type, this.deviceIds = const []});

  @HiveField(0)
  int type;

  @HiveField(1)
  List<String> deviceIds;
}
