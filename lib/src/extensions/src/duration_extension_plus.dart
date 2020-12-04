extension DurationExtensionPlus on Duration {
  /// Duration in months
  int get months {
    return inDays.remainder(60).toInt();
  }

  /// Duration in days
  int get days {
    return inDays.toInt();
  }

  /// Duration in hours
  int get hours {
    return inHours.remainder(60).toInt();
  }

  /// Duration in hours formatted
  String get hoursStr {
    return hours.toString().padLeft(2, "0");
  }

  /// Duration in minutes
  int get minutes {
    return inMinutes.remainder(60).toInt();
  }

  /// Duration in minutes formatted
  String get minutesStr {
    return minutes.toString().padLeft(2, "0");
  }

  /// Duration in seconds
  int get seconds {
    return inSeconds.remainder(60).toInt();
  }

  /// Duration in seconds formatted
  String get secondsStr {
    return seconds.toString().padLeft(2, "0");
  }

  /// Duration formatted
  String get formattedDuration {
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
