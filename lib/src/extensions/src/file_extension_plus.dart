import 'dart:convert';
import 'dart:io';

extension FileExtensionPlus on File {
  String get base64Sync {
    if (this == null) {
      return null;
    } else {
      List<int> fileBytes = this.readAsBytesSync();
      return base64Encode(fileBytes);
    }
  }

  Future<String> get base64Async {
    if (this == null) {
      return null;
    } else {
      return this.readAsBytes().then((fileBytes) => base64Encode(fileBytes));
    }
  }
}
