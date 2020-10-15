import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/components/src/border_plus.dart';
import 'package:flutter_plus/src/plus/components/src/radius_plus.dart';

final NavigatorPlus navigatorPlus = NavigatorPlus.instance;

class NavigatorPlus {
  // SINGLETON
  static final instance = NavigatorPlus._();
  NavigatorPlus._();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get getNavigatorKey {
    if (this._navigatorKey == null || this._navigatorKey.currentState == null) {
      print(
          '_navigatorKey not set -> MaterialApp > navigatorKey: navigatorPlus.navigatorKey');

      return null;
    } else
      return _navigatorKey;
  }

  /// Use only to init.
  ///
  /// MaterialApp > navigatorKey: navigatorPlus.key
  ///
  GlobalKey<NavigatorState> get key {
    return _navigatorKey;
  }

  BuildContext get currentContext =>
      this.getNavigatorKey?.currentState?.overlay?.context;

  void navigate(
    dynamic destination, {
    bool modal,
    bool replace,
    bool maintainState,
    RouteSettings settings,
  }) {
    FocusManager.instance.primaryFocus.unfocus();
    if (replace != null && replace == true) {
      this.getNavigatorKey?.currentState?.pushReplacement(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    } else {
      this.getNavigatorKey?.currentState?.push(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    }
  }

  bool get canPop {
    if (this.getNavigatorKey == null ||
        this.getNavigatorKey.currentState == null)
      return false;
    else
      return this.getNavigatorKey.currentState.canPop();
  }

  pop({dynamic result}) {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop) this.getNavigatorKey.currentState.pop(result);
  }

  popAll() {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop)
      this
          .getNavigatorKey
          .currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
  }

  showBottomSheet({
    @required Widget child,
    Function(dynamic result) onClosed,
    Color backgroundColor,
    Color barrierColor,
    bool isDismissible = true,
    bool isScrollControlled = true,
    bool enableDrag = true,
    double elevation = 0,
    double heightPercentScreen,
    Clip clipBehavior = Clip.none,
    RadiusPlus radius,
    BorderPlus border,
  }) {
    FocusManager.instance.primaryFocus.unfocus();

    bool _validHeightPercentScreen = heightPercentScreen != null &&
        heightPercentScreen > 0 &&
        heightPercentScreen <= 1;

    if (isScrollControlled == false && _validHeightPercentScreen == true)
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
        if (heightPercentScreen != null) {
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
