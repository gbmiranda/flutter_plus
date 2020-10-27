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
      return null;
    } else {
      DateTime beginningNextMonth = (this.month < 12)
          ? new DateTime(this.year, this.month + 1, 1)
          : new DateTime(this.year + 1, 1, 1);
      return beginningNextMonth.subtract(new Duration(days: 1)).day;
    }
  }

  int get daysOfYear {
    if (this == null) {
      return null;
    } else {
      DateTime firstMonth = DateTime(this.year, 1, 1);
      DateTime lastMonth = DateTime(this.year, 12, 31);
      return firstMonth.difference(lastMonth).inDays;
    }
  }

  bool get isToday {
    if (this == null) {
      return false;
    } else {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final dateCheck = DateTime(this.year, this.month, this.day);
      return today == dateCheck;
    }
  }

  String get monthName {
    return this.format('MMMM');
  }

  String get monthNameSort {
    return this.format('MMM');
  }

  String get weekName {
    return this.format('EEEE');
  }

  String get weekNameSort {
    return this.format('EEE');
  }
}
