import 'package:flutter/material.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({required WidgetBuilder builder, required RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class ZoomRoute<T> extends MaterialPageRoute<T> {
  ZoomRoute({required WidgetBuilder builder, required RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return const ZoomPageTransitionsBuilder().buildTransitions(this, context, animation, secondaryAnimation, child);
  }
}

class SlideRoute<T> extends MaterialPageRoute<T> {
  SlideRoute({required WidgetBuilder builder, required RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return const CupertinoPageTransitionsBuilder().buildTransitions(this, context, animation, secondaryAnimation, child);
  }
}
