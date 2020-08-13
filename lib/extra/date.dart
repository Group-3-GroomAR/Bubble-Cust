String getWeekName(int day) {
  String _week;
  if (day == 1) {
    _week = "Monday";
  } else if (day == 2) {
    _week = "Tuesday";
  } else if (day == 3) {
    _week = "Wednesday";
  } else if (day == 4) {
    _week = "Thursday";
  } else if (day == 5) {
    _week = "Friday";
  } else if (day == 6) {
    _week = "Satureday";
  } else if (day == 7) {
    _week = "Sunday";
  }

  return _week;
}
