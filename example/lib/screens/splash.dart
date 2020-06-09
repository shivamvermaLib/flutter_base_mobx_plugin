import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/base_screen.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_base_mobx_plugin/widgets/listview_utils.dart';
import 'package:flutter_base_mobx_plugin_example/generated/i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

import '../main.dart';

part 'splash.g.dart';

class SplashScreen extends BaseScreen {
  final _splashStore = SplashStore();

  @override
  Widget builder(BuildContext context, TextTheme textTheme) {
    ThemeStore themeStore = StoreProvider.of<ThemeStore>(context);
    LocalizationStore localizationStore =
        StoreProvider.of<LocalizationStore>(context);
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Set Theme"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  themeStore.themeData = ThemeData(
                    accentColor: Colors.redAccent,
                    primaryColor: Colors.red,
                    backgroundColor: Colors.white,
                    textTheme: GoogleFonts.loraTextTheme(
                        TextTheme(button: TextStyle(color: Colors.blue))),
                  );
                  themeStore.statusBarColor = Colors.orange;
                  themeStore.systemNavigationBarColor = Colors.orange;
                },
                child: Text("Theme1 With Font"),
              ),
              RaisedButton(
                onPressed: () {
                  themeStore.themeData = ThemeData(
                      accentColor: Colors.greenAccent,
                      primaryColor: Colors.green,
                      brightness: Brightness.dark,
                      textTheme: GoogleFonts.latoTextTheme());
                  themeStore.statusBarColor = Colors.green;
                  themeStore.systemNavigationBarColor = Colors.greenAccent;
                },
                child: Text("Theme2 with Font"),
              ),
            ],
          ),
          Text("Set Language"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  I18n.locale = Locale('en', 'US');
                  localizationStore.appLocal = Locale('en', 'US');
                },
                child: Text("English"),
              ),
              RaisedButton(
                onPressed: () {
                  I18n.locale = Locale('fr', "FR");
                  localizationStore.appLocal = Locale('fr', "FR");
                },
                child: Text("French"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(I18n.of(context).title),
              Text(I18n.of(context).greetTo("Shivam")),
            ],
          ),
          Text("Responsive"),
          // Text("$sizingInformation"),
          Text("List"),
          Expanded(
            child: Observer(
              builder: (BuildContext context) {
                return MobXListView(
                  baseScreenStore: baseScreenStore,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Title $index"),
                      subtitle: Text("SubTitle $index"),
                      onTap: () {
                        if (index == 0) {
                          NavigationStore navigationStore =
                              StoreProvider.of<NavigationStore>(context);
                          print("sD->${navigationStore.hashCode}");

                          navigationStore.navigateTo(Screens.HOME.toString());
                        }
                        _splashStore.itemCount++;
                      },
                    );
                  },
                  scrollReachesEnd: () {
                    print("End");
                    _splashStore.itemCount += _splashStore.itemCount;
                  },
                  key: Key("list_key_unique"),
                  length:
                      List.generate(_splashStore.itemCount, (index) => index)
                          .length,
                  scrollListener: (double scrollPositionPixels) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies(BuildContext context) {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("Lifecycle->$state");
  }

  @override
  void dispose(BuildContext context) {}

  @override
  void init(BuildContext context) {
    mytimer();
    addReaction(
        "test",
        reaction((_) => _splashStore.itemCount, (count) {
          showMessage("Count:$count");
        }));
  }

  @override
  String get title => "Test Screen";

  void mytimer() async {
    await Future.delayed(Duration(milliseconds: 300));
    _splashStore.itemCount = 5;
  }
}

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  int itemCount = 15;
}
