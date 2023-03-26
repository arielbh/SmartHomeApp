import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/modules/app_services/services/shared_preferences_service.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

class HomeState {
  final List<Home> allHomes;
  final Home? active;

  HomeState({required this.allHomes, this.active});
}

class HomeService extends Cubit<HomeState> {
  final DatabaseService database;
  final LocalStorageService localStorageService;
  HomeService({
    required this.database,
    required this.localStorageService,
  }) : super(HomeState(allHomes: [])) {
    database.watch<Home>().then((value) => value.listen((event) => loadHomes()));
    loadHomes();
  }

  void loadHomes() async {
    final allHomes = database.getAll<Home>();
    final key = localStorageService.getInt("activeHome");

    final active = (key != null) ? allHomes.firstWhereOrNull((element) => element.key == key) : null;
    emit(HomeState(allHomes: allHomes, active: active));
  }

  void removeActiveHome() {
    localStorageService.remove("activeHome");
    emit(HomeState(allHomes: state.allHomes, active: null));
  }

  Future<void> activate(int key) async {
    await localStorageService.setInt("activeHome", key);
    final active = state.allHomes.firstWhereOrNull((element) => element.key == key);
    emit(HomeState(allHomes: state.allHomes, active: active));
  }
}
