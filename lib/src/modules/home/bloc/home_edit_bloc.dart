import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

abstract class HomeEditEvent {}

class SaveEvent extends HomeEditEvent {}

class _ReadEvent extends HomeEditEvent {
  final dynamic key;
  _ReadEvent(this.key);
}

class UpdateNameEvent extends HomeEditEvent {
  final String text;

  UpdateNameEvent(this.text);
}

class HomeEditState {
  final Home home;

  HomeEditState({required this.home});
}

class HomeEditBloc extends Bloc<HomeEditEvent, HomeEditState> {
  final DatabaseService database;

  HomeEditBloc({required this.database, dynamic key}) : super(HomeEditState(home: Home(name: ''))) {
    on<_ReadEvent>((event, emit) async {
      var home = await database.get<Home>(key);
      emit(HomeEditState(home: home ?? Home(name: '')));
    });
    on<UpdateNameEvent>((event, emit) {
      state.home.name = event.text;
      emit(HomeEditState(home: state.home));
    });

    on<SaveEvent>((event, emit) => database.save<Home>(state.home));

    if (key != null) {
      add(_ReadEvent(key));
    }
  }
}
