import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/app_models/app_home.dart';
import 'package:smart_home_app/src/common/app_models/app_room.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
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
    // database.watch<Home>().then((value) => value.listen((event) => loadHomes()));

    loadHomes();
  }

  void loadHomes() async {
    final allHomes = database.getAll<Home>();
    if (allHomes.isEmpty) {
      final home = state.active.toDb();
      await database.save(home);
    } else {
      final active = AppHome.fromDb(allHomes.first);
      emit(HomeState(active: active));
    }
    // final key = localStorageService.getInt("activeHome");

    // final active = (key != null) ? allHomes.firstWhereOrNull((element) => element.key == key) : null;
    // emit(HomeState(allHomes: allHomes, active: active));
  }

  // void removeActiveHome() {
  //   localStorageService.remove("activeHome");
  //   emit(HomeState(allHomes: state.allHomes, active: null));
  // }

  // Future<void> activate(int key) async {
  //   await localStorageService.setInt("activeHome", key);
  //   final active = state.allHomes.firstWhereOrNull((element) => element.key == key);
  //   emit(HomeState(allHomes: state.allHomes, active: active));
  // }

  addDevice(String deviceId, RoomType roomType) {
    final exitingRoom = state.active.rooms.firstWhereOrNull((room) => room.type == roomType);
    if (exitingRoom == null) {
      final room = AppRoom(type: roomType, deviceIds: [deviceId]);
      final home = state.active.copyWith(rooms: [...state.active.rooms, room]);
      emit(HomeState(active: home));
      return;
    } else {
      final room = exitingRoom.copyWith(deviceIds: [...exitingRoom.deviceIds, deviceId]);
      final home = state.active.copyWith(rooms: [
        ...state.active.rooms.where((element) => element.type != roomType),
        room,
      ]);
      emit(HomeState(active: home));
    }
  }
}
