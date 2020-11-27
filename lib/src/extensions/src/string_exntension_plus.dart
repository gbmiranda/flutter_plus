import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensionPlus on String {
  bool get isNotNullOrEmpty {
    return this != null && isNotEmpty;
  }

  String get firstLetter {
    if (isNotNullOrEmpty) {
      return this[0].toUpperCase();
    } else {
      return null;
    }
  }

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

  String get toBase64 {
    if (isNotNullOrEmpty) {
      var stringToBase64 = utf8.fuse(base64);
      return stringToBase64.encode(this);
    } else {
      return null;
    }
  }

  String get fromBase64 {
    if (isNotNullOrEmpty) {
      var stringToBase64 = utf8.fuse(base64);
      return stringToBase64.decode(this);
    } else {
      return null;
    }
  }

  String get cleanString {
    if (isNotNullOrEmpty) {
      return replaceAll(RegExp(r'[^\w\s]+'), '');
    } else {
      return null;
    }
  }

  String get cleanStringAndSpaces {
    if (isNotNullOrEmpty) {
      return replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
    } else {
      return null;
    }
  }

  bool get isEmail {
    return _checkRegex(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
  }

  bool get isCpf {
    if (isNotNullOrEmpty) {
      return false;
    } else {
      var sanitizedCPF =
          replaceAll(RegExp(r'\.|-'), '').split('').map(int.parse).toList();
      return !_blacklistedCPF(sanitizedCPF.join()) &&
          sanitizedCPF[9] ==
              _gerarDigitoVerificador(sanitizedCPF.getRange(0, 9).toList()) &&
          sanitizedCPF[10] ==
              _gerarDigitoVerificador(sanitizedCPF.getRange(0, 10).toList());
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

  bool get isCelular {
    return _checkRegex(r'^\([1-9]{2}\) [0-9]{5}\-[0-9]{4}$');
  }

  bool get isTelefone {
    return _checkRegex(r'^\([1-9]{2}\) [0-9]{4}\-[0-9]{4}$');
  }

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

  String get cleanDiacritics {
    if (isNotNullOrEmpty) {
      return removeDiacritics(this);
    } else {
      return null;
    }
  }

  String get removerAcentos {
    return cleanDiacritics;
  }

  String get capitalizeFirstWord {
    if (isNotNullOrEmpty) {
      var input = toLowerCase();
      return input[0].toUpperCase() + input.substring(1);
    } else {
      return null;
    }
  }

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

  DateTime toDate({@required String format}) {
    if (isNotNullOrEmpty) {
      return DateFormat(format).parse(this);
    } else {
      return null;
    }
  }

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

  bool get isBool {
    if (isNotNullOrEmpty) {
      return (this == 'true' || this == 'false');
    } else {
      return false;
    }
  }

  bool get isDateTime {
    return _checkRegex(r"^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$");
  }

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
