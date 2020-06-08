import 'package:flutter/material.dart';

abstract class ScreenDelegate {
  String get initialScreen;
  Widget getScreen(RouteSettings settings);
  // PageRouteBuilder pageTransitionType(RouteSettings settings);
}
