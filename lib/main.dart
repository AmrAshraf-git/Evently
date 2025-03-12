import 'package:evently_app/core/services/localStorage/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();

  runApp(const MyApp());

}


