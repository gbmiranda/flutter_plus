library flutter_plus;

import 'package:flutter_plus/src/utils/utils_export_plus.dart';

export 'flutter_plus_exports.dart';

class FlutterPlus {
  FlutterPlus._();
  static UtilsPlus utils = utilsPlus;
  static LocalStoragePlus localStorage = localStoragePlus;
  static NavigatorPlus navigator = navigatorPlus;
  static SnackBarPlus snackBar = snackBarPlus;
  static DialogPlus dialog = dialogPlus;
  static BottomSheetPlus bottomSheet = bottomSheetPlus;
}
