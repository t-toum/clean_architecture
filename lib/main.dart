import 'package:flutter/material.dart';
import 'package:flutter_generate/core/DI/service_locator.dart';
import 'package:flutter_generate/core/routers/app_router.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
