import 'package:flutter/material.dart';
import 'package:travel_planner_app/router/router.dart';

class TravelPlannerApp extends StatelessWidget {
  TravelPlannerApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
