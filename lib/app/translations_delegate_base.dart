import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

abstract class TranslationBase {
  Locale locale;
  List<Locale> get supportedLocales;
  Map<String, Map<String, String>> get localizedValues;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }
}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  final TranslationBase translationBase;
  TranslationBaseDelegate(this.translationBase);

  @override
  bool isSupported(Locale locale) =>
      translationBase?.localizedValues?.keys?.contains(locale.languageCode) ??
      false;

  @override
  Future<TranslationBase> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    translationBase.locale = locale;
    return SynchronousFuture<TranslationBase>(translationBase);
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
