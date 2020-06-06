import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class ObserverListener extends StatefulWidget {
  final Widget child;
  final String name;
  final void Function(Reaction) listener;

  const ObserverListener(
      {Key key, this.name, @required this.listener, @required this.child})
      : super(key: key);
  @override
  _ObserverListenerState createState() => _ObserverListenerState();
}

class _ObserverListenerState extends State<ObserverListener> {
  ReactionDisposer _reactionDisposerForListener;

  @override
  void dispose() {
    _reactionDisposerForListener();
    super.dispose();
  }

  _initAutorun() async {
    if (_reactionDisposerForListener != null) {
      _reactionDisposerForListener();
    }
    _reactionDisposerForListener = autorun(widget.listener,
        delay: 300, name: widget.name ?? 'ObserverListener$this');
    await Future.delayed(Duration(milliseconds: 301));
  }

  @override
  Widget build(BuildContext context) {
    _initAutorun();
    return widget.child;
  }
}
