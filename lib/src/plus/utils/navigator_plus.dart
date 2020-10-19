import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/src/plus/components/src/border_plus.dart';
import 'package:flutter_plus/src/plus/components/src/radius_plus.dart';

final navigatorPlus = NavigatorPlus._instance;

class NavigatorPlus {
  // SINGLETON
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

  GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  GlobalKey<NavigatorState> addKey(GlobalKey<NavigatorState> newKey) {
    this._navigatorKey = newKey;
    return this._navigatorKey;
  }

  /// Use only to init.
  ///
  /// MaterialApp > navigatorKey: navigatorPlus.key
  ///
  // GlobalKey<NavigatorState> get key {
  //   return _navigatorKey;
  // }

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

  bool get canPop {
    if (this._getNavigatorKey == null ||
        this._getNavigatorKey.currentState == null)
      return false;
    else
      return this._getNavigatorKey.currentState.canPop();
  }

  pop({dynamic result}) {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop) this._getNavigatorKey.currentState.pop(result);
  }

  popAll() {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop)
      this
          ._getNavigatorKey
          .currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
  }
}
