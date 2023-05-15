import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/app_models/app_home.dart';
import 'package:smart_home_app/src/common/app_models/app_room.dart';
import 'package:smart_home_app/src/common/interfaces/room_type.dart';
import 'package:smart_home_app/src/modules/home/services/home_accessor.dart';

class HomeState {
  final AppHome active;

  HomeState({required this.active});
}

class HomeService extends Cubit<HomeState> {
  final HomeAccessor accessor;
  HomeService({
    required this.accessor,
  }) : super(HomeState(active: const AppHome(name: 'My Home', rooms: []))) {
    loadHomes();
  }

  void loadHomes() async {
    final currentHome = accessor.getHome();
    if (currentHome == null) {
      final key = await accessor.saveHome(state.active);
      final newHome = state.active.copyWith(key: key);
      emit(HomeState(active: newHome));
    } else {
      emit(HomeState(active: currentHome));
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
    await accessor.saveHome(home);
    emit(HomeState(active: home));
  }
}
