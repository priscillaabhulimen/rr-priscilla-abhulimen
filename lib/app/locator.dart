
import 'package:get_it/get_it.dart';
import 'package:rr_priscilla_abhulimen/core/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {

  /////////////////////////////////////////
  ///Third Party Services
  ////////////////////////////////////////
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

}