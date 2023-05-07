import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  Future<void> registerSchema<T>(TypeAdapter<T> adapter) async {
    Hive.registerAdapter<T>(adapter);
    await Hive.openBox<T>("${T}Box");
  }

  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<T?> get<T>(dynamic key) async {
    final box = Hive.box<T>("${T}Box");
    return box.get(key);
  }

  List<T> getAll<T>() {
    final box = Hive.box<T>("${T}Box");
    return box.values.toList();
  }

  Future<int> save<T extends HiveObject>(T instance) async {
    if (instance.key != null) {
      await instance.save();
      return instance.key;
    }
    final box = Hive.box<T>("${T}Box");
    final result = await box.add(instance);
    return result;
  }

  Future<Stream<BoxEvent>> watch<T>() async {
    final box = Hive.box<T>("${T}Box");
    return box.watch();
  }
}
