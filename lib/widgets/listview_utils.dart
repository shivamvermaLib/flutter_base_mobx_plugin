import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/stores/basescreen/base_screen_store.dart';

class MobXListView<T> extends StatelessWidget {
  final List<T> list;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) sepratedBuilder;
  final void Function() scrollReachesEnd;
  final void Function(double scrollPositionPixels) scrollListener;
  final BaseScreenStore baseScreenStore;
  const MobXListView({
    @required Key key,
    @required this.list,
    @required this.itemBuilder,
    this.scrollListener,
    @required this.baseScreenStore,
    this.sepratedBuilder,
    this.scrollReachesEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController(
        initialScrollOffset: baseScreenStore.listScrollPosition["$key"] ?? 0);
    _scrollController.addListener(() {
      scrollListener?.call(_scrollController.position.pixels);
      baseScreenStore.listScrollPosition["$key"] =
          _scrollController.position.pixels;
    });
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          scrollReachesEnd?.call();
        }
      },
      child: ListView.separated(
        controller: _scrollController,
        itemCount: list.length,
        itemBuilder: itemBuilder,
        separatorBuilder: sepratedBuilder ??
            (BuildContext context, int index) => SizedBox.shrink(),
      ),
    );
  }
}
