import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class ScreenDelegate {
  String get initialScreen;
  Widget getScreen(RouteSettings settings);
  PageTransitionType pageTransitionType(RouteSettings settings);
}
