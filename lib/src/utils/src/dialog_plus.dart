import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';
import 'package:flutter_plus/src/utils/src/utils_plus.dart';

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
    double screenHorizontalMargin,
  }) {
    if (closeKeyboardWhenOpen == true) {
      utilsPlus.closeKeyboard();
    }
    showDialog(
      context: navigatorPlus.currentContext,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      builder: (context) {
        return this._createDialog(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [child],
          ),
          elevation,
          radius,
          border,
          screenHorizontalMargin,
        );
      },
    );
  }

  void showDefault({
    // title
    String title,
    Color titleColor,
    double titleSize,
    FontWeight titleWeight,
    // message
    String message,
    Color messageColor,
    double messageSize,
    FontWeight messageWeight,
    // button one
    String buttonOneText,
    Color buttonOneTextColor,
    double buttonOneTextSize,
    FontWeight buttonOneTextWeight,
    Color buttonOneColor,
    RadiusPlus buttonOneRadius,
    Function buttonOneCallback,
    // buttonTwo
    String buttonTwoText,
    Color buttonTwoTextColor,
    double buttonTwoTextSize,
    FontWeight buttonTwoTextWeight,
    Color buttonTwoColor,
    RadiusPlus buttonTwoRadius,
    Function buttonTwoCallback,
    // others
    double buttonsHeight,
    EdgeInsetsGeometry padding,
    Color barrierColor,
    bool barrierDismissible = true,
    bool closeKeyboardWhenOpen = true,
    RadiusPlus radius,
    BorderPlus border,
    double elevation = 1,
    double elementsSpacing = 16,
    double screenHorizontalMargin,
  }) {
    if (closeKeyboardWhenOpen == true) {
      utilsPlus.closeKeyboard();
    }
    showDialog(
      context: navigatorPlus.currentContext,
      barrierColor: barrierColor,
      barrierDismissible: (buttonOneText == null || buttonOneText == null)
          ? true
          : barrierDismissible,
      builder: (context) {
        Widget buttonsContent;
        if (buttonOneText.isNotNullOrEmpty && buttonTwoText.isNotNullOrEmpty) {
          buttonsContent = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: this._createButton(
                  buttonOneText,
                  buttonOneTextColor,
                  buttonOneTextSize,
                  buttonOneTextWeight,
                  buttonsHeight,
                  buttonOneColor,
                  buttonOneRadius,
                  buttonOneCallback,
                ),
              ),
              SizedBox(
                width: elementsSpacing,
              ),
              Expanded(
                child: this._createButton(
                  buttonTwoText,
                  buttonTwoTextColor,
                  buttonTwoTextSize,
                  buttonTwoTextWeight,
                  buttonsHeight,
                  buttonTwoColor,
                  buttonTwoRadius,
                  buttonTwoCallback,
                ),
              )
            ],
          );
        } else if (buttonOneText.isNotNullOrEmpty) {
          buttonsContent = this._createButton(
            buttonOneText,
            buttonOneTextColor,
            buttonOneTextSize,
            buttonOneTextWeight,
            buttonsHeight,
            buttonOneColor,
            buttonOneRadius,
            buttonOneCallback,
          );
        } else if (buttonTwoText.isNotNullOrEmpty) {
          buttonsContent = this._createButton(
            buttonTwoText,
            buttonTwoTextColor,
            buttonTwoTextSize,
            buttonTwoTextWeight,
            buttonsHeight,
            buttonTwoColor,
            buttonTwoRadius,
            buttonTwoCallback,
          );
        }

        TextPlus titleWidget;
        if (title != null) {
          titleWidget = TextPlus(
            title,
            color: titleColor ?? Colors.black,
            fontSize: titleSize ?? 20,
            fontWeight: titleWeight ?? FontWeight.w700,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
          );
        }

        TextPlus messageWidget;
        if (message != null) {
          messageWidget = TextPlus(
            message,
            color: messageColor ?? Colors.grey,
            fontSize: messageSize ?? 16,
            fontWeight: messageWeight ?? FontWeight.normal,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
          );
        }

        var dialogContent = Padding(
          padding: padding ?? EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              titleWidget ?? SizedBox.shrink(),
              messageWidget != null
                  ? SizedBox(
                      height: elementsSpacing,
                    )
                  : SizedBox.shrink(),
              messageWidget ?? SizedBox.shrink(),
              buttonsContent != null
                  ? SizedBox(
                      height: elementsSpacing,
                    )
                  : SizedBox.shrink(),
              buttonsContent ?? SizedBox.shrink(),
            ],
          ),
        );
        return this._createDialog(
          dialogContent,
          elevation,
          radius ?? RadiusPlus.all(20),
          border,
          screenHorizontalMargin,
        );
      },
    );
  }

  _createDialog(
    Widget child,
    double elevation,
    RadiusPlus radius,
    BorderPlus border,
    double screenHorizontalMargin,
  ) {
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
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenHorizontalMargin ?? 24,
      ),
    );
  }

  ButtonPlus _createButton(
    String buttonText,
    Color buttonTextColor,
    double buttonTextSize,
    FontWeight buttonTextWeight,
    double buttonsHeight,
    Color buttonColor,
    RadiusPlus buttonRadius,
    Function buttonCallback,
  ) {
    return ButtonPlus(
      child: TextPlus(
        buttonText,
        color: buttonTextColor ?? Colors.white,
        fontSize: buttonTextSize ?? 18,
        fontWeight: buttonTextWeight ?? FontWeight.w700,
      ),
      height: buttonsHeight ?? 50,
      color: buttonColor ?? Colors.blue,
      radius: buttonRadius ?? RadiusPlus.all(12),
      onPressed: buttonCallback,
    );
  }
}
