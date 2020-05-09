import 'package:mobx/mobx.dart';

part 'base_screen_store.g.dart';

class BaseScreenStore = _BaseScreenStore with _$BaseScreenStore;

abstract class _BaseScreenStore with Store {
  @observable
  String title;
  @observable
  String message;
  @observable
  int bottomNavigationIndex;
  @observable
  bool showAppBar = true;
}
