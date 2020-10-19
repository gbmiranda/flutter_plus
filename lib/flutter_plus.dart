library flutter_plus;

export 'flutter_plus_exports.dart';

import 'flutter_plus_exports.dart';

final flutterPlus = FlutterPlus;

class FlutterPlus {
  FlutterPlus._();

  static NavigatorPlus navigator = navigatorPlus;
  static SnackBarPlus snackBar = snackBarPlus;
  static DialogPlus dialog = dialogPlus;
  static BottomSheetPlus bottomSheet = bottomSheetPlus;
}
