import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

extension StringExtensionPlus on String {
  bool get isNotNullOrEmpty {
    return this != null && this.isNotEmpty;
  }

  String get firstLetter {
    if (this.isNotNullOrEmpty) {
      return this[0].toUpperCase();
    } else {
      return null;
    }
  }

  String get firstWord {
    if (this.isNotNullOrEmpty) {
      List<String> words = this.split(' ');
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
    if (this.isNotNullOrEmpty) {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      return stringToBase64.encode(this);
    } else {
      return null;
    }
  }

  String get fromBase64 {
    if (this.isNotNullOrEmpty) {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      return stringToBase64.decode(this);
    } else {
      return null;
    }
  }

  String get cleanString {
    if (this.isNotNullOrEmpty) {
      return this.replaceAll(new RegExp(r'[^\w\s]+'), '');
    } else {
      return null;
    }
  }

  String get cleanStringAndSpaces {
    if (this.isNotNullOrEmpty) {
      return this.replaceAll(new RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
    } else {
      return null;
    }
  }

  bool get isEmail {
    return this._checkRegex(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  }

  bool get isCpf {
    if (this.isNotNullOrEmpty) {
      return false;
    } else {
      List<int> sanitizedCPF = this
          .replaceAll(new RegExp(r'\.|-'), '')
          .split('')
          .map((String digit) => int.parse(digit))
          .toList();
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
    int baseNumber = 0;
    for (var i = 0; i < digits.length; i++) {
      baseNumber += digits[i] * ((digits.length + 1) - i);
    }
    int verificationDigit = baseNumber * 10 % 11;
    return verificationDigit >= 10 ? 0 : verificationDigit;
  }

  bool get isCelular {
    return this._checkRegex(r'^\([1-9]{2}\) [0-9]{5}\-[0-9]{4}$');
  }

  bool get isTelefone {
    return this._checkRegex(r'^\([1-9]{2}\) [0-9]{4}\-[0-9]{4}$');
  }

  bool compareStrings(String text, {bool caseSensitive}) {
    if (this == null || text == null) {
      return false;
    } else if (this.isEmpty && text.isEmpty) {
      return true;
    } else {
      var originalStr = this.cleanString?.cleanDiacritics;
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
    if (this.isNotNullOrEmpty) {
      return null;
    } else {
      return removeDiacritics(this);
    }
  }

  String get removerAcentos {
    return this.cleanDiacritics;
  }

  String get capitalizeFirstWord {
    if (this.isNotNullOrEmpty) {
      return null;
    } else {
      var input = this.toLowerCase();
      return input[0].toUpperCase() + input.substring(1);
    }
  }

  String get capitalizeAllWords {
    if (this == null || this.isEmpty) {
      return null;
    } else {
      var input = this.toLowerCase();
      List<String> words = input.split(' ');
      var capitalized = words.map((word) {
        if (word.isEmpty) {
          return '';
        }
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');
      return capitalized;
    }
  }

  DateTime toDate({@required String format}) {
    if (this == null || this.isEmpty) {
      return null;
    } else {
      return DateFormat(format).parse(this);
    }
  }

  String setMask({@required String mask}) {
    if (this == null || this.isEmpty) {
      return null;
    } else {
      String cleanText = this.cleanStringAndSpaces;
      int maskItemCount = 0;
      String maskedString = '';
      for (var i = 0; i < mask.length; i++) {
        if (mask[i] == '#')
          maskedString += cleanText[i - maskItemCount];
        else {
          maskedString += mask[i];
          maskItemCount++;
        }
      }
      return maskedString;
    }
  }

  bool get isNum {
    if (this == null || this.isEmpty) {
      return false;
    } else {
      String source = this.trim();
      var numberValue = int.tryParse(source) ??
          double.tryParse(source) ??
          num.tryParse(source);
      return numberValue != null;
    }
  }

  bool get isBool {
    if (this == null || this.isEmpty) {
      return false;
    } else {
      return (this == 'true' || this == 'false');
    }
  }

  bool get isDateTime {
    return this
        ._checkRegex(r"^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$");
  }

  bool get isURL {
    return this._checkRegex(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");
  }

  bool _checkRegex(String regex) {
    if (this.isNotNullOrEmpty) {
      return false;
    } else {
      return RegExp(regex).hasMatch(this);
    }
  }
}
