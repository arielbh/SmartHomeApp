import 'package:hive/hive.dart';
import 'package:smart_home_app/src/common/db_models/room.dart';

part 'home.g.dart';

@HiveType(typeId: 1)
class Home extends HiveObject {
  Home({
    required this.name,
    this.rooms,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<Room>? rooms;
}
