import 'package:flutter/material.dart';

abstract class ScreenDelegate {
  String get initialScreen;
  Widget getScreen(RouteSettings settings);
  PageTransition pageTransitionType(RouteSettings settings);
}

enum PageTransition { rightToLeft, leftToRight }
