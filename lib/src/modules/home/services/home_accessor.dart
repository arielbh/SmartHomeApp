import 'package:collection/collection.dart';
import 'package:smart_home_app/src/common/app_models/app_home.dart';
import 'package:smart_home_app/src/common/app_models/app_room.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/common/db_models/room.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

class HomeAccessor {
  final DatabaseService database;
  HomeAccessor({
    required this.database,
  });
  AppHome? getHome() {
    final home = database.getAll<Home>().firstOrNull;
    if (home != null) {
      return AppHome.fromDb(home);
    }
    return null;
  }

  Future<int> saveHome(AppHome home) async {
    List<Room> rooms = [];
    for (final room in home.rooms) {
      final databaseRoom = await room.toDb(database);
      await database.save(databaseRoom);
      rooms.add(databaseRoom);
    }
    final db = await home.toDb(database, rooms);
    return database.save(db);
  }
}
