import 'package:flutter/material.dart';

final navigatorPlus = NavigatorPlus._instance;

class NavigatorPlus {
  static final _instance = NavigatorPlus._();
  NavigatorPlus._();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get _getNavigatorKey {
    if (_navigatorKey == null || _navigatorKey.currentState == null) {
      print('Need configuration');
      return null;
    } else {
      return _navigatorKey;
    }
  }

  GlobalKey<NavigatorState> get key {
    return _navigatorKey;
  }

  GlobalKey<NavigatorState> addKey(GlobalKey<NavigatorState> newKey) {
    _navigatorKey = newKey;
    return _navigatorKey;
  }

  BuildContext get currentContext =>
      _getNavigatorKey?.currentState?.overlay?.context;

  Future<dynamic> show(
    Widget destination, {
    bool replace,
    bool maintainState,
    RouteSettings settings,
  }) {
    FocusManager.instance.primaryFocus.unfocus();
    if (replace != null && replace == true) {
      return _getNavigatorKey?.currentState?.pushReplacement(
        MaterialPageRoute(
            builder: (context) => destination,
            fullscreenDialog: false,
            maintainState: maintainState ?? true,
            settings: settings ?? null),
      );
    } else {
      return _getNavigatorKey?.currentState?.push(
        MaterialPageRoute(
            builder: (context) => destination,
            fullscreenDialog: false,
            maintainState: maintainState ?? true,
            settings: settings ?? null),
      );
    }
  }

  Future<dynamic> showModal(
    Widget destination, {
    bool replace,
    bool maintainState,
    RouteSettings settings,
  }) {
    FocusManager.instance.primaryFocus.unfocus();
    if (replace != null && replace == true) {
      return _getNavigatorKey?.currentState?.pushReplacement(
        MaterialPageRoute(
            builder: (context) => destination,
            fullscreenDialog: true,
            maintainState: maintainState ?? true,
            settings: settings ?? null),
      );
    } else {
      return _getNavigatorKey?.currentState?.push(
        MaterialPageRoute(
            builder: (context) => destination,
            fullscreenDialog: true,
            maintainState: maintainState ?? true,
            settings: settings ?? null),
      );
    }
  }

  bool get canBack {
    if (_getNavigatorKey == null || _getNavigatorKey.currentState == null) {
      return false;
    } else {
      return _getNavigatorKey.currentState.canPop();
    }
  }

  void back({dynamic result}) {
    FocusManager.instance.primaryFocus.unfocus();
    if (canBack) _getNavigatorKey.currentState.pop(result);
  }

  void backAll() {
    FocusManager.instance.primaryFocus.unfocus();
    if (canBack) {
      _getNavigatorKey.currentState.popUntil((route) => route.isFirst);
    }
  }
}
