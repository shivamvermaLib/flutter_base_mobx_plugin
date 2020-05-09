import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'localization_store.g.dart';

class LocalizationStore = _LocalizationStore with _$LocalizationStore;

abstract class _LocalizationStore with Store {
  @observable
  Locale appLocal = Locale('en');
}
