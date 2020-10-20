import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/src/components/src/border_plus.dart';
import 'package:flutter_plus/src/components/src/radius_plus.dart';

final bottomSheetPlus = BottomSheetPlus._instance;

class BottomSheetPlus {
  static final _instance = BottomSheetPlus._();
  BottomSheetPlus._();

  show({
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
      context: navigatorPlus.currentContext,
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
