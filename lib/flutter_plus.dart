library flutter_plus;

import 'src/utils/utils_export_plus.dart';

export 'package:flutter_plus/src/components/components_export_plus.dart';
export 'package:flutter_plus/src/extensions/extensions_export_plus.dart';
export 'package:flutter_plus/src/utils/utils_export_plus.dart';
export 'package:flutter_plus/src/widgets/widgets_export_plus.dart';

class FlutterPlus {
  FlutterPlus._();

  /// Access FlutterPlus UtilsPlus
  static UtilsPlus utils = utilsPlus;

  /// Access FlutterPlus LocalStoragePlus
  static LocalStoragePlus localStorage = localStoragePlus;

  /// Access FlutterPlus NavigatorPlus
  static NavigatorPlus navigator = navigatorPlus;

  /// Access FlutterPlus SnackBarPlus
  static SnackBarPlus snackBar = snackBarPlus;

  /// Access FlutterPlus DialogPlus
  static DialogPlus dialog = dialogPlus;

  /// Access FlutterPlus BottomSheetPlus
  static BottomSheetPlus bottomSheet = bottomSheetPlus;
}
