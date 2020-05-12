import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/app_provider.dart';
import 'package:flutter_base_mobx_plugin/app/base_screen.dart';
import 'package:flutter_base_mobx_plugin/app/responsive/sizing_information.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/app/translations_delegate_base.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_base_mobx_plugin/widgets/listview_utils.dart';
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
                  );
                },
                child: Text("Theme1"),
              ),
              RaisedButton(
                onPressed: () {
                  themeStore.changeTheme(
                    primaryColor: Colors.green,
                    accentColor: Colors.greenAccent,
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
                  localizationStore.appLocal = Locale('en');
                },
                child: Text("English"),
              ),
              RaisedButton(
                onPressed: () {
                  localizationStore.appLocal = Locale('ar');
                },
                child: Text("Arabic"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(Localizations.of(context, TranslationBase).title),
              Text(Localizations.of(context, TranslationBase).subTitle),
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
                        navigationStore.navigateTo(Screens.HOME.toString());
                      },
                    );
                  },
                  scrollReachesEnd: () {
                    print("End");
                    _splashStore.itemCount += _splashStore.itemCount;
                  },
                  key: Key("list_key_unique"),
                  list: List.generate(_splashStore.itemCount, (index) => index),
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
