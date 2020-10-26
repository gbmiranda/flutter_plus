import 'package:flutter/material.dart';

final navigatorPlus = NavigatorPlus._instance;

class NavigatorPlus {
  static final _instance = NavigatorPlus._();
  NavigatorPlus._();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get _getNavigatorKey {
    if (this._navigatorKey == null || this._navigatorKey.currentState == null) {
      print(
          '_navigatorKey not set -> MaterialApp > navigatorKey: navigatorPlus.navigatorKey');

      return null;
    } else
      return _navigatorKey;
  }

  GlobalKey<NavigatorState> get key {
    return _navigatorKey;
  }

  GlobalKey<NavigatorState> addKey(GlobalKey<NavigatorState> newKey) {
    this._navigatorKey = newKey;
    return this._navigatorKey;
  }

  BuildContext get currentContext =>
      this._getNavigatorKey?.currentState?.overlay?.context;

  Future<dynamic> navigate(
    dynamic destination, {
    bool modal,
    bool replace,
    bool maintainState,
    RouteSettings settings,
  }) {
    FocusManager.instance.primaryFocus.unfocus();
    if (replace != null && replace == true) {
      return this._getNavigatorKey?.currentState?.pushReplacement(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    } else {
      return this._getNavigatorKey?.currentState?.push(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    }
  }

  bool get canBack {
    if (this._getNavigatorKey == null ||
        this._getNavigatorKey.currentState == null)
      return false;
    else
      return this._getNavigatorKey.currentState.canPop();
  }

  back({dynamic result}) {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canBack) this._getNavigatorKey.currentState.pop(result);
  }

  backAll() {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canBack)
      this
          ._getNavigatorKey
          .currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
  }
}
