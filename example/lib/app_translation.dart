import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/translations_delegate_base.dart';

class AppTranslation extends TranslationBase {
  @override
  List<Locale> get supportedLocales => [
        const Locale('ar', ''), // Arabic
        const Locale('en', ''), // English
      ];

  @override
  Map<String, Map<String, String>> get localizedValues => {
        'en': {
          'title': 'Hello World',
          'subTitle': 'Sub Title',
        },
        'ar': {
          'title': 'مرحبا بالعالم',
          'subTitle': 'لعنوان الفرعي',
        },
      };

  String get title {
    return localizedValues[locale.languageCode]['title'];
  }

  String get subTitle {
    return localizedValues[locale.languageCode]['subTitle'];
  }
}
