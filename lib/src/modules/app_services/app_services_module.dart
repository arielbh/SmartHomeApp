import 'package:get_it/get_it.dart';
import 'package:prism_flutter_getit/prism_flutter_getit.dart';
import 'package:smart_home_app/src/modules/app_services/services/toaster.dart';

class AppServicesModule extends GetItModule {
  @override
  Future<void> init(GetIt container) async {
    container.registerLazySingleton<ToasterService>(() => ToasterService());
    container.registerSingleton(Toaster());
  }
}
