library flutter_plus;

import 'src/utils/utils_export_plus.dart';

export 'package:flutter_plus/src/components/components_export_plus.dart';
export 'package:flutter_plus/src/extensions/extensions_export_plus.dart';
export 'package:flutter_plus/src/utils/utils_export_plus.dart';
export 'package:flutter_plus/src/widgets/widgets_export_plus.dart';

class FlutterPlus {
  FlutterPlus._();
  static UtilsPlus utils = utilsPlus;
  static LocalStoragePlus localStorage = localStoragePlus;
  static NavigatorPlus navigator = navigatorPlus;
  static SnackBarPlus snackBar = snackBarPlus;
  static DialogPlus dialog = dialogPlus;
  static BottomSheetPlus bottomSheet = bottomSheetPlus;
}
