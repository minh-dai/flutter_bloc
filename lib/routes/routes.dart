import 'package:flutter/material.dart';
import 'package:scan_card/pages/home.dart';
import 'package:scan_card/routes/route_name.dart';
import 'transitions.dart';

class RouteGenerator {
  final String routeName;

  RouteGenerator(this.routeName);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteGenerator route = RouteGenerator(settings.name!);
    final dynamic args = settings.arguments ?? {};
    switch (settings.name) {
      case RouteName.home:
      default:
        return route.normal(const Home());
    }
  }

  cancelBack(Widget widget) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WillPopScope(onWillPop: () async => false, child: widget),
    );
  }

  normal(Widget widget) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  fade(Widget widget) {
    return FadeRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  zoom(Widget widget) {
    return ZoomRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }

  slide(Widget widget) {
    return SlideRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }
}
