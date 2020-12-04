import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

extension FileExtensionPlus on File {
  /// Convert File to base64 sync
  String get base64Sync {
    if (this == null) {
      return null;
    } else {
      List<int> fileBytes = readAsBytesSync();
      return base64Encode(fileBytes);
    }
  }

  /// Convert File to base64 async
  Future<String> get base64Async {
    if (this == null) {
      return null;
    } else {
      return readAsBytes().then(base64Encode);
    }
  }

  /// Get File complete name
  String get fileName {
    return path.basename(this.path);
  }

  /// Get File name without extension
  String get fileNameWithoutExtension {
    return path.basenameWithoutExtension(this.path);
  }

  /// Get File extension
  String get fileExtension {
    return path.extension(this.path);
  }
}
