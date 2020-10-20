library flutter_plus;

export 'flutter_plus_exports.dart';

import 'flutter_plus_exports.dart';
import 'src/plus/utils/flutter_plus_utils.dart';
import 'src/plus/utils/local_storage_plus.dart';

final flutterPlus = FlutterPlus;

class FlutterPlus {
  FlutterPlus._();

  static FlutterPlusUtils utils = flutterPlusUtils;
  static LocalStoragePlus localStorage = localStoragePlus;
  static NavigatorPlus navigator = navigatorPlus;
  static SnackBarPlus snackBar = snackBarPlus;
  static DialogPlus dialog = dialogPlus;
  static BottomSheetPlus bottomSheet = bottomSheetPlus;
}
