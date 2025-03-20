import 'package:evently_app/core/services/localStorage/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'core/resources/routes_manager.dart';
import 'core/services/localStorage/local_storage_key.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  bool isFirstRun=LocalStorageService.getBool(LocalStorageKeys.isFirstTimeRun)??true;
  String initialRoute=isFirstRun? RoutesManager.onboarding: RoutesManager.forgetPassword;

  runApp(MyApp(initialRoute: initialRoute));

}


