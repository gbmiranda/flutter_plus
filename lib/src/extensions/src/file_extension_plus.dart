import 'dart:convert';
import 'dart:io';

extension FileExtensionPlus on File {
  String get syncBase64 {
    if (this == null) {
      return null;
    } else {
      List<int> fileBytes = this.readAsBytesSync();
      return base64Encode(fileBytes);
    }
  }

  Future<String> get asyncBase64 {
    if (this == null) {
      return null;
    } else {
      return this.readAsBytes().then((fileBytes) => base64Encode(fileBytes));
    }
  }
}
