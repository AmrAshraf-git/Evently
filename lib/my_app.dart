import 'package:evently_app/config/theme/app_theme.dart';
import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/core/services/localStorage/local_storage_key.dart';
import 'package:evently_app/core/services/localStorage/local_storage_service.dart';
import 'package:evently_app/presentation/screens/auth/login/login.dart';
import 'package:evently_app/presentation/screens/home/home.dart';
import 'package:evently_app/presentation/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';


var isFirstRun=LocalStorageService.getBool(LocalStorageKeys.isFirstTimeRun)??true;

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routes: {
        RoutesManager.onboarding: (_) => const Onboarding(),
        RoutesManager.login: (_) => const Login(),
      },
      initialRoute: isFirstRun? RoutesManager.onboarding: RoutesManager.login,
      //home: Onboarding(),
    );
  }
}