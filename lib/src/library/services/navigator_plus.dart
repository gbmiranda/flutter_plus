import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/components/border_plus.dart';
import 'package:flutter_plus/src/plus/components/radius_plus.dart';

final NavigatorPlus navigatorPlus = NavigatorPlus.instance;

class NavigatorPlus {
  // SINGLETON
  static final instance = NavigatorPlus._();
  NavigatorPlus._();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  /// Use only to init.
  ///
  /// MaterialApp > navigatorKey: navigatorPlus.setNavigatorKey
  ///
  GlobalKey<NavigatorState> get setNavigatorKey {
    return _navigatorKey;
  }

  GlobalKey<NavigatorState> get navigatorKey {
    if (this._navigatorKey == null || this._navigatorKey.currentState == null) {
      print(
          'navigatorPlus not set -> MaterialApp > navigatorKey: navigatorPlus.setNavigatorKey');

      return null;
    } else
      return _navigatorKey;
  }

  BuildContext get currentContext =>
      this.navigatorKey?.currentState?.overlay?.context;

  void navigate(
    dynamic destination, {
    bool modal,
    bool replace,
    bool maintainState,
    RouteSettings settings,
  }) {
    FocusManager.instance.primaryFocus.unfocus();
    if (replace != null && replace == true) {
      this.navigatorKey?.currentState?.pushReplacement(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    } else {
      this.navigatorKey?.currentState?.push(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true,
                settings: settings ?? null),
          );
    }
  }

  bool get canPop {
    if (this.navigatorKey == null || this.navigatorKey.currentState == null)
      return false;
    else
      return this.navigatorKey.currentState.canPop();
  }

  pop({dynamic result}) {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop) this.navigatorKey.currentState.pop(result);
  }

  popAll() {
    FocusManager.instance.primaryFocus.unfocus();
    if (this.canPop)
      this
          .navigatorKey
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
