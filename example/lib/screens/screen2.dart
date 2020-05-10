import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/base_screen.dart';

class Screen2 extends BaseScreen {
  @override
  Widget builder(BuildContext context, TextTheme textTheme) {
    return Center(
      child: Text("Screen2"),
    );
  }

  @override
  void didChangeDependencies(BuildContext context) {}

  @override
  void dispose(BuildContext context) {}

  @override
  void init(BuildContext context) {}

  @override
  String get title => "Screen 2";
}
