import 'package:auto_route/auto_route.dart';
import 'package:food_app/src/core/router/router.gr.dart';

import 'routeromer.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...routesomer,
      ];
}
