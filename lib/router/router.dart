import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:travel_planner_app/screens/news/news_info/news_info_screen.dart';
import 'package:travel_planner_app/screens/news/news_list/news_list_screen.dart';
import 'package:travel_planner_app/screens/onboarding/onboarding_screen.dart';
import 'package:travel_planner_app/screens/settings/settings_screen.dart';
import 'package:travel_planner_app/screens/travel/add_travel/add_travel_screen.dart';
import 'package:travel_planner_app/screens/travel/travel_info/travel_info_screen.dart';
import 'package:travel_planner_app/screens/travel/travel_list/travel_list_screen.dart';
import 'package:travel_planner_app/models/travel_model.dart';
import 'package:travel_planner_app/models/news_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: TravelListRoute.page),
        AutoRoute(page: NewsListRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: AddTravelRoute.page),
        AutoRoute(page: TravelInfoRoute.page),
        AutoRoute(page: NewsInfoRoute.page),
      ];
}
