import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/base_screen.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_base_mobx_plugin/widgets/listview_utils.dart';
import 'package:flutter_base_mobx_plugin_example/generated/i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                  themeStore.changeTheme(
                    primaryColor: Colors.orange,
                    accentColor: Colors.orangeAccent,
                    statusBarColor: Colors.orangeAccent,
                    systemNavigationBarColor: Colors.orange,
                  );
                },
                child: Text("Theme1"),
              ),
              RaisedButton(
                onPressed: () {
                  themeStore.changeTheme(
                    primaryColor: Colors.green,
                    accentColor: Colors.greenAccent,
                    statusBarColor: Colors.green,
                    systemNavigationBarColor: Colors.greenAccent,
                  );
                },
                child: Text("Theme2"),
              ),
            ],
          ),
          Text("Set Language"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  // I18n.locale = Locale('en', 'US');
                  localizationStore.appLocal = Locale('en', 'US');
                },
                child: Text("English"),
              ),
              RaisedButton(
                onPressed: () {
                  // I18n.locale = Locale('fr', "FR");
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
                        NavigationStore navigationStore =
                            StoreProvider.of<NavigationStore>(context);
                        print("sD->${navigationStore.hashCode}");

                        navigationStore.navigateTo(Screens.HOME.toString());
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
  void dispose(BuildContext context) {}

  @override
  void init(BuildContext context) {}

  @override
  String get title => "Test Screen";
}

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  int itemCount = 15;
}
