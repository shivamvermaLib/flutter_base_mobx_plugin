import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/stores/basescreen/base_screen_store.dart';

class MobXGridView extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final void Function() scrollReachesEnd;
  final void Function(double scrollPositionPixels) scrollListener;
  final Future<void> Function() onRefresh;
  final BaseScreenStore baseScreenStore;
  final Axis scrollDirection;
  final int crossAxisCount;
  final EdgeInsetsGeometry padding;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  const MobXGridView({
    @required Key key,
    @required this.length,
    @required this.itemBuilder,
    this.scrollListener,
    @required this.baseScreenStore,
    this.scrollReachesEnd,
    this.onRefresh,
    this.scrollDirection = Axis.vertical,
    this.padding = EdgeInsets.zero,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
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
    final gridView = GridView.builder(
      controller: _scrollController,
      padding: padding,
      itemCount: length,
      scrollDirection: scrollDirection,
      itemBuilder: itemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
    );
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          scrollReachesEnd?.call();
        }
        return true;
      },
      child: onRefresh != null
          ? RefreshIndicator(
              child: gridView,
              onRefresh: onRefresh,
            )
          : gridView,
    );
  }
}
