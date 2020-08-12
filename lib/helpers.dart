class Helpers {
  static String dateToString(DateTime date) {
    final weekdays = [
      '',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun'
    ];

    final months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final weekday = weekdays[date.weekday];
    final month = months[date.month];
    final day = date.day;
    final year = date.year;

    return weekday + ', ' + month + ' ' + day.toString() + ', ' +
        year.toString();
  }
}