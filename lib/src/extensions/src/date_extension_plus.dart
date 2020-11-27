import 'package:intl/intl.dart';

extension DateExtensionPlus on DateTime {
  String format(String format) {
    if (this == null) {
      return null;
    } else {
      return DateFormat(format).format(this);
    }
  }

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

  int get daysOfYear {
    if (this == null) {
      return -1;
    } else {
      final firstMonth = DateTime(year, 1, 1);
      final lastMonth = DateTime(year, 12, 31);
      return firstMonth.difference(lastMonth).inDays;
    }
  }

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

  String get monthName {
    return format('MMMM');
  }

  String get monthNameSort {
    return format('MMM');
  }

  String get weekName {
    return format('EEEE');
  }

  String get weekNameSort {
    return format('EEE');
  }

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
