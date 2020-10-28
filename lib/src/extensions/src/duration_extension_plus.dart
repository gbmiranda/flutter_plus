extension DurationExtensionPlus on Duration {
  int get months {
    return this.inDays.remainder(60).toInt();
  }

  int get days {
    return this.inDays.toInt();
  }

  int get hours {
    return this.inHours.remainder(60).toInt();
  }

  String get hoursStr {
    return hours.toString().padLeft(2, "0");
  }

  int get minutes {
    return this.inMinutes.remainder(60).toInt();
  }

  String get minutesStr {
    return minutes.toString().padLeft(2, "0");
  }

  int get seconds {
    return this.inSeconds.remainder(60).toInt();
  }

  String get secondsStr {
    return seconds.toString().padLeft(2, "0");
  }

  String get formattedDuration {
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
