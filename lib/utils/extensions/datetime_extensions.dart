extension DateTimeExtensions on DateTime {
  static DateTime from(DateTime date, DateTime time) {
    final Duration duration = Duration(
      hours: time.hour,
      minutes: time.minute,
      seconds: time.second,
    );
    // remote 3 hours for KSA
    final DateTime result =
        date.add(duration).subtract(const Duration(hours: 3));
    final DateTime finalDate = DateTime.utc(result.year, result.month,
        result.day, result.hour, result.minute, result.second);
    return finalDate.toLocal();
  }
}
