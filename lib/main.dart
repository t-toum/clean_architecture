import 'package:flutter/material.dart';
import 'package:flutter_generate/core/util/app_navigator.dart';
import 'package:flutter_generate/core/util/router.dart';
import 'package:flutter_generate/core/DI/service_locator.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.homeRoute,
    );
  }
}
