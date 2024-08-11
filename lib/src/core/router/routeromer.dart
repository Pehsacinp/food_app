import 'package:auto_route/auto_route.dart';
import 'package:food_app/src/core/router/router.gr.dart';

List<AutoRoute> get routesomer => [
      /* CustomRoute(
          page: QuestionsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom), */
      CustomRoute(
        page: LandingRoute.page,
        initial: true,
      ),
      CustomRoute(
        page: HomeDetailRoute.page,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      ),
    ];
