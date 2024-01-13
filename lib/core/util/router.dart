import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generate/core/DI/service_locator.dart';
import 'package:flutter_generate/core/widgets/not_found.dart';
import 'package:flutter_generate/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:flutter_generate/features/home/presentation/pages/detail_page.dart';
import 'package:flutter_generate/features/home/presentation/pages/home_page.dart';

class AppRoute {
  static const String homeRoute = "/";
  static const String detailRoute = "/detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _materialRoute(
          const MyHomePage(),
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()..fetchTodoList(),
            ),
          ],
        );
      case detailRoute:
        return _materialRoute(const DetailPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }
}
