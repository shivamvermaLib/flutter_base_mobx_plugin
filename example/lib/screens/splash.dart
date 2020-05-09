import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/base_screen.dart';
import 'package:flutter_base_mobx_plugin/app/translations_delegate_base.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme_store.dart';
import 'package:provider/provider.dart';

class SplashScreen extends BaseScreen {
  @override
  Widget builder(BuildContext context, TextTheme textTheme) {
    ThemeStore themeStore = context.watch<ThemeStore>();
    LocalizationStore localizationStore = context.watch<LocalizationStore>();
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
