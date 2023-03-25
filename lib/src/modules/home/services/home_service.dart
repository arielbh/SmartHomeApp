import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/modules/database/services/database_service.dart';

class HomeService extends Cubit<List<Home>> {
  final DatabaseService database;
  HomeService({required this.database}) : super([]) {
    database.watch<Home>().then((value) => value.listen((event) => loadHomes()));
  }

  Future<void> loadHomes() async {
    emit(await database.getAll<Home>());
  }
}
