import 'dart:math';
import 'package:intl/intl.dart';

extension NumExtensionPlus on num {
  /// Num to locale currency with symbol or not
  String? toCurrency({bool? withSymbol}) {
    if (isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false) {
        return NumberFormat.simpleCurrency(name: '').format(this).trim();
      } else {
        return NumberFormat.simpleCurrency().format(this).trim();
      }
    }
  }

  /// Num to locale compact currency with symbol or not
  String? toCurrencyCompact({bool? withSymbol}) {
    if (isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false) {
        return NumberFormat.compactSimpleCurrency(name: '').format(this).trim();
      } else {
        return NumberFormat.compactSimpleCurrency().format(this).trim();
      }
    }
  }

  /// Num with specific fraction digits
  double toPrecision(int fractionDigits) {
    if (isNullOrZero) {
      return -1.0;
    } else {
      var mod = pow(10, fractionDigits.toDouble()).toDouble();
      return ((this * mod).round().toDouble() / mod);
    }
  }

  /// Transform number of days into hours
  num get daysToHours {
    if (isNullOrZero) {
      return -1;
    } else {
      return this * Duration.hoursPerDay;
    }
  }

  /// Transform number of minutes into hours
  num get minutesToHours {
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.minutesPerHour;
    }
  }

  /// Transform number of seconds into hours
  num get secondsToHours {
    // 3600 seconds = 1 hour
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.secondsPerHour;
    }
  }

  /// Transform number of hours into days
  num get hoursToDays {
    // 24 hours = 1 day
    if (isNullOrZero) {
      return -1;
    } else {
      return this * Duration.hoursPerDay;
    }
  }

  /// Transform number of seconds into minutes
  num get secondsToMinutes {
    // 60 seconds = 1 minute
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.secondsPerMinute;
    }
  }

  /// Transform number of hours into minutes
  num get hoursToMinutes {
    // 60 seconds = 1 minute
    if (isNullOrZero) {
      return -1;
    } else {
      return this * Duration.minutesPerHour;
    }
  }

  /// Checks whether number is 0 or null
  bool get isNullOrZero {
    if (this == null || this == 0) {
      return true;
    } else {
      return false;
    }
  }
}
