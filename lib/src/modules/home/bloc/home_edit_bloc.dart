import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

abstract class HomeEditEvent {}

class SaveEvent extends HomeEditEvent {}

class _ReadEvent extends HomeEditEvent {
  final dynamic key;
  _ReadEvent(this.key);
}

class _UpdateFromServiceEvent extends HomeEditEvent {}

class UpdateNameEvent extends HomeEditEvent {
  final String text;

  UpdateNameEvent(this.text);
}

class UpdateActiveEvent extends HomeEditEvent {
  final bool isActive;

  UpdateActiveEvent(this.isActive);
}

class UpdateCurrentEvent extends HomeEditEvent {
  final int index;

  UpdateCurrentEvent(this.index);
}

class HomeEditState {
  final Home currentHome;
  final Home? activeHome;
  final List<Home> allHomes;

  HomeEditState({
    required this.allHomes,
    required this.currentHome,
    this.activeHome,
  });
}

class HomeEditBloc extends Bloc<HomeEditEvent, HomeEditState> {
  final HomeService homeService;
  final DatabaseService database;

  HomeEditBloc({
    required this.homeService,
    required this.database,
    dynamic key,
  }) : super(
          HomeEditState(
            allHomes: homeService.state.allHomes,
            currentHome: Home(name: ''),
            activeHome: homeService.state.active,
          ),
        ) {
    on<_ReadEvent>((event, emit) async {
      final home = homeService.state.allHomes.firstWhereOrNull((element) => element.key == event.key);
      emit(HomeEditState(
        allHomes: state.allHomes,
        activeHome: state.activeHome,
        currentHome: home ?? Home(name: ''),
      ));
    });
    on<UpdateActiveEvent>((event, emit) {
      if (state.currentHome == state.activeHome) {
        homeService.removeActiveHome();
      } else {
        homeService.activate(state.currentHome.key);
      }
    });
    on<UpdateCurrentEvent>((event, emit) => emit(HomeEditState(
          allHomes: state.allHomes,
          activeHome: state.activeHome,
          currentHome: state.allHomes[event.index],
        )));
    on<UpdateNameEvent>((event, emit) {
      state.currentHome.name = event.text;
      // emit(HomeEditState(
      //   allHomes: state.allHomes,
      //   activeHome: state.activeHome,
      //   currentHome: state.currentHome,
      // ));
    });
    on<SaveEvent>((event, emit) => database.save<Home>(state.currentHome));
    if (key != null) {
      add(_ReadEvent(key));
    }
    on<_UpdateFromServiceEvent>((event, emit) => emit(HomeEditState(
          allHomes: homeService.state.allHomes,
          activeHome: homeService.state.active,
          currentHome: state.currentHome,
        )));
    homeService.stream.listen((_) {
      add(_UpdateFromServiceEvent());
    });
  }
}
