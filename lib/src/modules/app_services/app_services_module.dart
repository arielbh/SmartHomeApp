import 'package:get_it/get_it.dart';
import 'package:prism_flutter_getit/prism_flutter_getit.dart';
import 'package:smart_home_app/src/modules/app_services/services/shared_preferences_service.dart';

class AppServicesModule extends GetItModule {
  @override
  Future<void> init(GetIt container) async {
    final storage = SharedPreferencesLocalStorageService();
    await storage.initialize();
    container.registerSingleton<LocalStorageService>(storage);
  }
}
