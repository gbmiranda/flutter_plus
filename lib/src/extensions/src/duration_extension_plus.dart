extension DurationExtensionPlus on Duration {
  int get months {
    return inDays.remainder(60).toInt();
  }

  int get days {
    return inDays.toInt();
  }

  int get hours {
    return inHours.remainder(60).toInt();
  }

  String get hoursStr {
    return hours.toString().padLeft(2, "0");
  }

  int get minutes {
    return inMinutes.remainder(60).toInt();
  }

  String get minutesStr {
    return minutes.toString().padLeft(2, "0");
  }

  int get seconds {
    return inSeconds.remainder(60).toInt();
  }

  String get secondsStr {
    return seconds.toString().padLeft(2, "0");
  }

  String get formattedDuration {
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
