import 'package:intl/intl.dart';

extension DateExtensionPlus on DateTime {
  /// Format DateTime to String
  String? format(String format) {
    if (this == null) {
      return null;
    } else {
      return DateFormat(format).format(this);
    }
  }

  /// Number of days in month
  int get daysOfMonth {
    if (this == null) {
      {
        return -1;
      }
    } else {
      final beginningNextMonth = (month < 12)
          ? DateTime(year, month + 1, 1)
          : DateTime(year + 1, 1, 1);
      return beginningNextMonth.subtract(Duration(days: 1)).day;
    }
  }

  /// Number of days in year
  int get daysOfYear {
    if (this == null) {
      return -1;
    } else {
      final firstMonth = DateTime(year, 1, 1);
      final lastMonth = DateTime(year, 12, 31);
      return firstMonth.difference(lastMonth).inDays;
    }
  }

  /// Checks whether it is the current day
  bool get isToday {
    if (this == null) {
      return false;
    } else {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final dateCheck = DateTime(year, month, day);
      return today == dateCheck;
    }
  }

  /// Month name
  String? get monthName {
    return format('MMMM');
  }

  /// Month name sort
  String? get monthNameSort {
    return format('MMM');
  }

  /// Week name
  String? get weekName {
    return format('EEEE');
  }

  /// Week name sort
  String? get weekNameSort {
    return format('EEE');
  }

  /// Checks if two dates are equal
  bool sameDay(DateTime compareDate) {
    if (this == null) {
      return false;
    } else {
      return day == compareDate.day &&
          month == compareDate.month &&
          year == compareDate.year;
    }
  }
}
