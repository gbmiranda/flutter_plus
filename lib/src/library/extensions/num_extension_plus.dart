import 'dart:math';
import 'package:intl/intl.dart';

extension NumExtensionPlus on num {
  String toCurrency({bool withSymbol}) {
    if (this.isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false)
        return NumberFormat.simpleCurrency(name: '').format(this).trim();
      else
        return NumberFormat.simpleCurrency().format(this).trim();
    }
  }

  String toCurrencyCompact({bool withSymbol}) {
    if (this.isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false)
        return NumberFormat.compactSimpleCurrency(name: '').format(this).trim();
      else
        return NumberFormat.compactSimpleCurrency().format(this).trim();
    }
  }

  double toPrecision(int fractionDigits) {
    if (this.isNullOrZero) {
      return null;
    } else {
      var mod = pow(10, fractionDigits.toDouble()).toDouble();
      return ((this * mod).round().toDouble() / mod);
    }
  }

  // toHours
  num get daysToHours {
    if (this.isNullOrZero) {
      return null;
    } else {
      return this * Duration.hoursPerDay;
    }
  }

  num get minutesToHours {
    if (this.isNullOrZero) {
      return null;
    } else {
      return this / Duration.minutesPerHour;
    }
  }

  num get secondsToHours {
    // 3600 seconds = 1 hour
    if (this.isNullOrZero) {
      return null;
    } else {
      return this / Duration.secondsPerHour;
    }
  }

  // toDays

  num get hoursToDays {
    // 24 hours = 1 day
    if (this.isNullOrZero) {
      return null;
    } else {
      return this * Duration.hoursPerDay;
    }
  }

  // toMinutes

  num get secondsToMinutes {
    // 60 seconds = 1 minute
    if (this.isNullOrZero) {
      return null;
    } else {
      return this / Duration.secondsPerMinute;
    }
  }

  num get hoursToMinutes {
    // 60 seconds = 1 minute
    if (this.isNullOrZero) {
      return null;
    } else {
      return this * Duration.minutesPerHour;
    }
  }

  // check

  bool get isNullOrZero {
    if (this == null || this == 0) {
      return true;
    } else
      return false;
  }
}
