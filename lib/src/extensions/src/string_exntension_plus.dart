import 'dart:convert';
import 'package:diacritic/diacritic.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

extension StringExtensionPlus on String {
  /// Checks whether string is empty or null
  bool get isNullOrEmpty {
    return this == null && !isNotEmpty;
  }

  /// Checks whether string is not empty or null
  bool get isNotNullOrEmpty {
    return this != null && isNotEmpty;
  }

  /// Get first letter of string
  String get firstLetter {
    if (isNotNullOrEmpty) {
      return this[0].toUpperCase();
    } else {
      return null;
    }
  }

  /// Get first word of string
  String get firstWord {
    if (isNotNullOrEmpty) {
      var words = split(' ');
      if (words.length > 0) {
        return words[0];
      } else {
        return this;
      }
    } else {
      return '';
    }
  }

  /// Convert String to base64
  String get toBase64 {
    if (isNotNullOrEmpty) {
      var stringToBase64 = utf8.fuse(base64);
      return stringToBase64.encode(this);
    } else {
      return null;
    }
  }

  /// Convert base64 to String
  String get fromBase64 {
    if (isNotNullOrEmpty) {
      var stringToBase64 = utf8.fuse(base64);
      return stringToBase64.decode(this);
    } else {
      return null;
    }
  }

  /// Remove special characters from the String
  String get cleanString {
    if (isNotNullOrEmpty) {
      return replaceAll(RegExp(r'[^\w\s]+'), '');
    } else {
      return null;
    }
  }

  /// Remove special characters and spaces from the String
  String get cleanStringAndSpaces {
    if (isNotNullOrEmpty) {
      return replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
    } else {
      return null;
    }
  }

  /// Checks whether the string is an e-mail
  bool get isEmail {
    return _checkRegex(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
  }

  /// Checks whether the string is an CPF (Brazil)
  bool get isCpf {
    if (isNotNullOrEmpty) {
      var sanitizedCPF =
          replaceAll(RegExp(r'\.|-'), '').split('').map(int.parse).toList();
      return !_blacklistedCPF(sanitizedCPF.join()) &&
          sanitizedCPF[9] ==
              _gerarDigitoVerificador(sanitizedCPF.getRange(0, 9).toList()) &&
          sanitizedCPF[10] ==
              _gerarDigitoVerificador(sanitizedCPF.getRange(0, 10).toList());
    } else {
      return false;
    }
  }

  bool _blacklistedCPF(String cpf) {
    return cpf == '00000000000' ||
        cpf == '11111111111' ||
        cpf == '22222222222' ||
        cpf == '33333333333' ||
        cpf == '44444444444' ||
        cpf == '55555555555' ||
        cpf == '66666666666' ||
        cpf == '77777777777' ||
        cpf == '88888888888' ||
        cpf == '99999999999';
  }

  int _gerarDigitoVerificador(List<int> digits) {
    var baseNumber = 0;
    for (var i = 0; i < digits.length; i++) {
      baseNumber += digits[i] * ((digits.length + 1) - i);
    }
    var verificationDigit = baseNumber * 10 % 11;
    return verificationDigit >= 10 ? 0 : verificationDigit;
  }

  /// Checks whether the string is an cellphone (Brazil)
  bool get isCelular {
    return _checkRegex(r'^\([1-9]{2}\) [0-9]{5}\-[0-9]{4}$');
  }

  /// Checks whether the string is an phone number (Brazil)
  bool get isTelefone {
    return _checkRegex(r'^\([1-9]{2}\) [0-9]{4}\-[0-9]{4}$');
  }

  /// Compare to another String with caseSensitive or not
  bool compareStrings(String text, {bool caseSensitive}) {
    if (this == null || text == null) {
      return false;
    } else if (isEmpty && text.isEmpty) {
      return true;
    } else {
      var originalStr = cleanString?.cleanDiacritics;
      var compareStr = text.cleanString?.cleanDiacritics;
      if (originalStr == null || compareStr == null) {
        return false;
      }
      if (caseSensitive == false) {
        originalStr = originalStr.toLowerCase();
        compareStr = compareStr.toLowerCase();
      }
      return originalStr.compareTo(compareStr) == 0;
    }
  }

  /// Containes to another String with caseSensitive or not
  bool containesStrings(String text, {bool caseSensitive}) {
    if (this == null || text == null) {
      return false;
    } else if (isEmpty && text.isEmpty) {
      return true;
    } else {
      var originalStr = cleanString?.cleanDiacritics;
      var compareStr = text.cleanString?.cleanDiacritics;
      if (originalStr == null || compareStr == null) {
        return false;
      }
      if (caseSensitive == false) {
        originalStr = originalStr.toLowerCase();
        compareStr = compareStr.toLowerCase();
      }
      return originalStr.contains(compareStr) == 0;
    }
  }

  /// Remove diacritics from the String
  /// Remove acentos da String
  String get cleanDiacritics {
    if (isNotNullOrEmpty) {
      return removeDiacritics(this);
    } else {
      return null;
    }
  }

  /// Capitalize first word from the String
  String get capitalizeFirstWord {
    if (isNotNullOrEmpty) {
      var input = toLowerCase();
      return input[0].toUpperCase() + input.substring(1);
    } else {
      return null;
    }
  }

  /// Capitalize all words from the String
  String get capitalizeAllWords {
    if (isNotNullOrEmpty) {
      var input = toLowerCase();
      var words = input.split(' ');
      var capitalized = words.map((word) {
        if (word.isEmpty) {
          return '';
        }
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');
      return capitalized;
    } else {
      return null;
    }
  }

  /// Transfor String to DateTime
  DateTime toDate({@required String format}) {
    if (isNotNullOrEmpty) {
      return DateFormat(format).parse(this);
    } else {
      return null;
    }
  }

  /// Set custom mask to String
  String setMask({@required String mask}) {
    if (isNotNullOrEmpty) {
      var cleanText = cleanStringAndSpaces;
      var maskItemCount = 0;
      var maskedString = '';
      for (var i = 0; i < mask.length; i++) {
        if (mask[i] == '#') {
          maskedString += cleanText[i - maskItemCount];
        } else {
          maskedString += mask[i];
          maskItemCount++;
        }
      }
      return maskedString;
    } else {
      return null;
    }
  }

  /// Checks whether a String is a number
  bool get isNum {
    if (isNotNullOrEmpty) {
      var source = trim();
      var numberValue = int.tryParse(source) ??
          double.tryParse(source) ??
          num.tryParse(source);
      return numberValue != null;
    } else {
      return false;
    }
  }

  /// Checks whether a String is a bool
  bool get isBool {
    if (isNotNullOrEmpty) {
      return (this == 'true' || this == 'false');
    } else {
      return false;
    }
  }

  /// Checks whether a String is a dateTime
  // bool get isDateTime {
  //   // return _checkRegex(r"^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$");
  // }

  /// Checks whether a String is a dateTime
  bool isDateTime({@required String format}) {
    if (format.isNotNullOrEmpty || isNotNullOrEmpty) {
      try {
        var dateTime = toDate(format: format);
        if (dateTime != null) {
          return true;
        } else {
          return false;
        }
      } on Exception catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  /// Checks whether a String is a url
  bool get isURL {
    return _checkRegex(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    );
  }

  bool _checkRegex(String regex) {
    if (isNotNullOrEmpty) {
      return RegExp(regex).hasMatch(this);
    } else {
      return false;
    }
  }
}
