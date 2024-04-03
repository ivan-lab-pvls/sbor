// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTravelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTravelScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TravelInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TravelInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TravelInfoScreen(
          key: args.key,
          travel: args.travel,
        ),
      );
    },
    TravelListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TravelListScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTravelScreen]
class AddTravelRoute extends PageRouteInfo<void> {
  const AddTravelRoute({List<PageRouteInfo>? children})
      : super(
          AddTravelRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTravelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TravelInfoScreen]
class TravelInfoRoute extends PageRouteInfo<TravelInfoRouteArgs> {
  TravelInfoRoute({
    Key? key,
    required TravelModel travel,
    List<PageRouteInfo>? children,
  }) : super(
          TravelInfoRoute.name,
          args: TravelInfoRouteArgs(
            key: key,
            travel: travel,
          ),
          initialChildren: children,
        );

  static const String name = 'TravelInfoRoute';

  static const PageInfo<TravelInfoRouteArgs> page =
      PageInfo<TravelInfoRouteArgs>(name);
}

class TravelInfoRouteArgs {
  const TravelInfoRouteArgs({
    this.key,
    required this.travel,
  });

  final Key? key;

  final TravelModel travel;

  @override
  String toString() {
    return 'TravelInfoRouteArgs{key: $key, travel: $travel}';
  }
}

/// generated route for
/// [TravelListScreen]
class TravelListRoute extends PageRouteInfo<void> {
  const TravelListRoute({List<PageRouteInfo>? children})
      : super(
          TravelListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TravelListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
