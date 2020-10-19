import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/src/plus/components/src/border_plus.dart';
import 'package:flutter_plus/src/plus/components/src/radius_plus.dart';

final navigatorPlus = NavigatorPlus.instance;

class NavigatorPlus {
  // SINGLETON
  static final instance = NavigatorPlus._();
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

  showBottomSheet({
    @required Widget child,
    Function(dynamic result) onClosed,
    Color backgroundColor,
    Color barrierColor,
    bool isDismissible = true,
    bool isScrollControlled = false,
    bool enableDrag = true,
    double elevation = 0,
    double heightPercentScreen,
    double height,
    Clip clipBehavior = Clip.none,
    RadiusPlus radius,
    BorderPlus border,
  }) {
    FocusManager.instance.primaryFocus.unfocus();

    bool _validCustomHeight = (height != null && height > 0) ||
        (heightPercentScreen != null &&
            heightPercentScreen > 0 &&
            heightPercentScreen <= 1);

    if (isScrollControlled == false && _validCustomHeight == true)
      isScrollControlled = true;

    showModalBottomSheet(
      context: this.currentContext,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      elevation: elevation,
      clipBehavior: clipBehavior,
      shape: RoundedRectangleBorder(
        borderRadius: radius?.toBorderRadius ?? BorderRadius.zero,
        side: border?.toBorderSide ?? BorderSide.none,
      ),
      builder: (BuildContext context) {
        if (height != null && height > 0) {
          child = SizedBox(
            height: height,
            child: child,
          );
        } else if (heightPercentScreen != null) {
          if (heightPercentScreen > 0 && heightPercentScreen <= 1) {
            var _screenHeight = MediaQuery.of(context).size.height;
            var percentHeight = _screenHeight * heightPercentScreen;
            child = SizedBox(
              height: percentHeight,
              child: child,
            );
          } else {
            print(
                '[flutter_plus] heightPercentScreen: min > 0.0 and max <= 1.0');
          }
        }

        if (radius != null) {
          return ClipRRect(
            borderRadius: radius.toBorderRadius,
            child: child,
          );
        } else
          return child;
      },
    ).then((result) {
      if (onClosed != null) onClosed(result);
    });
  }
}
