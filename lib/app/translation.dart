import 'package:flutter/material.dart';

abstract class TranslationDelegate {
  bool get supportTranslation;
  List<Locale> get supportedLocales;
  List<LocalizationsDelegate<dynamic>> get localizationDelegates;
  Locale Function(Locale, Iterable<Locale>) get localeResolutionCallback;
}
