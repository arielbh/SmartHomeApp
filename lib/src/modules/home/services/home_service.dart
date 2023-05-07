import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/app_models/app_home.dart';
import 'package:smart_home_app/src/common/app_models/app_room.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/common/db_models/room.dart';
import 'package:smart_home_app/src/common/interfaces/room_type.dart';
import 'package:smart_home_app/src/modules/app_services/services/shared_preferences_service.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

class HomeState {
  final AppHome active;

  HomeState({required this.active});
}

class HomeService extends Cubit<HomeState> {
  final DatabaseService database;
  final LocalStorageService localStorageService;
  HomeService({
    required this.database,
    required this.localStorageService,
  }) : super(HomeState(active: const AppHome(name: 'My Home', rooms: []))) {
    loadHomes();
  }

  void loadHomes() async {
    final allHomes = database.getAll<Home>();
    if (allHomes.isEmpty) {
      final home = await state.active.toDb(database, []);
      await database.save(home);
      final newHome = state.active.copyWith(key: home.key);
      emit(HomeState(active: newHome));
    } else {
      final active = AppHome.fromDb(allHomes.first);
      emit(HomeState(active: active));
    }
  }

  Future<void> addDevice(String deviceId, RoomType roomType) async {
    final exitingRoom = state.active.rooms.firstWhereOrNull((room) => room.type == roomType);
    AppHome home;
    if (exitingRoom == null) {
      final room = AppRoom(type: roomType, deviceIds: [deviceId]);
      home = state.active.copyWith(rooms: [...state.active.rooms, room]);
    } else {
      final room = exitingRoom.copyWith(deviceIds: [...exitingRoom.deviceIds, deviceId]);
      home = state.active.copyWith(rooms: [
        ...state.active.rooms.where((element) => element.type != roomType),
        room,
      ]);
    }
    List<Room> rooms = [];
    for (final room in home.rooms) {
      final databaseRoom = await room.toDb(database);
      await database.save(databaseRoom);
      rooms.add(databaseRoom);
    }
    final databaseHome = await home.toDb(database, rooms);
    await database.save(databaseHome);
    emit(HomeState(active: home));
  }
}
