import 'package:auto_route/auto_route.dart';
import 'package:flutter_generate/features/home/presentation/pages/detail_page.dart';
import 'package:flutter_generate/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page, initial: true, children: []),
        AutoRoute(page: DetailRoute.page),
      ];
}
