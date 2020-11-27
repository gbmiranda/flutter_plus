import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

extension FileExtensionPlus on File {
  String get base64Sync {
    if (this == null) {
      return null;
    } else {
      List<int> fileBytes = readAsBytesSync();
      return base64Encode(fileBytes);
    }
  }

  Future<String> get base64Async {
    if (this == null) {
      return null;
    } else {
      return readAsBytes().then(base64Encode);
    }
  }

  String get fileName {
    return path.basename(this.path);
  }

  String get fileNameWithoutExtension {
    return path.basenameWithoutExtension(this.path);
  }

  String get fileExtension {
    return path.extension(this.path);
  }
}
