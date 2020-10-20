import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/src/plus/utils/flutter_plus_utils.dart';

final dialogPlus = DialogPlus._instance;

class DialogPlus {
  static final _instance = DialogPlus._();
  DialogPlus._();

  void show({
    @required Widget child,
    Color barrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = false,
    bool useSafeArea = false,
    RouteSettings routeSettings,
    bool closeKeyboardWhenOpen = true,
    RadiusPlus radius,
    BorderPlus border,
    double elevation = 1,
  }) {
    if (closeKeyboardWhenOpen == true) {
      flutterPlusUtils.closeKeyboard();
    }
    showDialog(
      context: navigatorPlus.currentContext,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      child: this._createDialog(child, elevation, radius, border),
    );
  }

  void showDefaultOneButton({
    @required TextPlus message,
    TextPlus title,
    ButtonPlus buttonOne,
    ButtonPlus buttonTwo,
    EdgeInsetsGeometry padding,
    Color barrierColor,
    bool barrierDismissible = true,
    bool closeKeyboardWhenOpen = true,
    RadiusPlus radius,
    BorderPlus border,
    double elevation = 1,
    double elementsSpacing = 16,
  }) {
    if (closeKeyboardWhenOpen == true) {
      flutterPlusUtils.closeKeyboard();
    }
    showDialog(
        context: navigatorPlus.currentContext,
        barrierColor: barrierColor,
        barrierDismissible: (buttonOne == null || buttonTwo == null)
            ? true
            : barrierDismissible,
        builder: (context) {
          Widget buttonsContent;
          if (buttonOne == null && buttonTwo == null) {
            buttonsContent = SizedBox.shrink();
          } else if (buttonOne != null && buttonTwo != null) {
            buttonsContent = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonOne,
                SizedBox(
                  width: elementsSpacing,
                ),
                buttonTwo,
              ],
            );
          } else if (buttonOne != null) {
            buttonsContent = buttonOne;
          } else if (buttonTwo != null) {
            buttonsContent = buttonTwo;
          } else {
            buttonsContent = SizedBox.shrink();
          }

          var dialogContent = Padding(
            padding: padding ?? EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title ?? SizedBox.shrink(),
                SizedBox(
                  height: elementsSpacing,
                ),
                message,
                SizedBox(
                  height: elementsSpacing,
                ),
                buttonsContent,
              ],
            ),
          );
          return this._createDialog(dialogContent, elevation, radius, border);
        });
  }

  _createDialog(
      Widget child, double elevation, RadiusPlus radius, BorderPlus border) {
    return Dialog(
      child: ClipRRect(
        borderRadius: radius?.toBorderRadius ?? BorderRadius.zero,
        child: child,
      ),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: radius?.toBorderRadius ?? BorderRadius.zero,
        side: border?.toBorderSide ?? BorderSide.none,
      ),
    );
  }
}
