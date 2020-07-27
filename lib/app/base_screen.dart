import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/stores/basescreen/base_screen_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

abstract class BaseScreen extends StatefulWidget
    implements BaseScreenComponents {
  final baseScreenStore = BaseScreenStore();
  final Map<String, ReactionDisposer> disposers = {};
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BaseScreen({Key key}) : super(key: key);

  void addReaction(String id, ReactionDisposer disposer) {
    if (disposers.containsKey(id)) {
      disposers[id]();
    }
    disposers[id] = disposer;
  }

  @override
  _BaseScreenState createState() => _BaseScreenState();
  @override
  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (BuildContext context) {
            return Text("${baseScreenStore.title ?? title ?? ''}");
          },
        ),
      );
  @override
  Widget bottomNavigationBar(BuildContext context) => null;
  @override
  Widget floatingActionButton(BuildContext context) => null;
  @override
  FloatingActionButtonLocation get floatingActionBarLocation => null;
  @override
  Widget drawer(BuildContext context) => null;
  @override
  void showMessage(String message, {Duration duration, SnackBarAction action}) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 4),
      action: action,
    ));
  }

  @override
  Future<bool> willPopScope() async => true;

  void didInitState(BuildContext context) {}
}

class _BaseScreenState extends State<BaseScreen> with AfterInitMixin<BaseScreen> {
  @override
  void initState() {
    super.initState();
    widget.init(context);
  }

  @override
  void didInitState() {
    widget.didInitState(context);
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).isCurrent) {
      widget.addReaction(
          "message",
          reaction((_) => widget.baseScreenStore.message, (message) {
            if (message != null) widget.showMessage(message);
            widget.baseScreenStore.message = null;
          }));
      ThemeStore themeStore = StoreProvider.of<ThemeStore>(context);
      TextTheme textTheme = Theme.of(context).textTheme;
      return WillPopScope(
          child: Observer(
            builder: (BuildContext context) {
              return Scaffold(
                key: widget.scaffoldKey,
                appBar: widget.baseScreenStore.showAppBar
                    ? widget.appBar(context)
                    : null,
                bottomNavigationBar: widget.bottomNavigationBar(context),
                floatingActionButton: widget.floatingActionButton(context),
                floatingActionButtonLocation: widget.floatingActionBarLocation,
                drawer: widget.drawer(context),
                backgroundColor:
                    themeStore?.themeData?.backgroundColor ?? Colors.white,
                body: SafeArea(child: widget.builder(context, textTheme)),
              );
            },
          ),
          onWillPop: widget.willPopScope);
    }
    return Container();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).isCurrent) widget.didChangeDependencies(context);
  }

  @override
  void dispose() {
    widget.dispose(context);
    super.dispose();
    for (var key in widget.disposers.keys) {
      widget.disposers[key]();
    }
  }
}

abstract class BaseScreenComponents {
  //No Implementation by default
  String get title;
  void init(BuildContext context);
  void dispose(BuildContext context);
  void didChangeDependencies(BuildContext context);
  Widget builder(BuildContext context, TextTheme textTheme);
  // Default has null
  AppBar appBar(BuildContext context);
  Widget drawer(BuildContext context);
  Widget bottomNavigationBar(BuildContext context);
  Widget floatingActionButton(BuildContext context);
  FloatingActionButtonLocation get floatingActionBarLocation;
  void showMessage(String message, {Duration duration});
  Future<bool> willPopScope();
}
