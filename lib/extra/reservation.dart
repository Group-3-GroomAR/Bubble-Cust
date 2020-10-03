class Reservation {
  int _resID;
  String _salon_id;
  String customer_id;
  int _total;
  DateTime _date;
  String _start_time;

  int _duration;
  String end_time;

  String _payment_id;
  String _note;

  int get resID => _resID;

  String setDate() {
    var day = _date.day;
    var month = _date.month;
    var year = _date.year;

    var mydate =
        day.toString() + "/" + month.toString() + "/" + year.toString();

    return mydate;
  }

  Reservation(
      this._resID,
      this._date,
      this._duration,
      this._start_time,
      this.end_time,
      this._total,
      this.customer_id,
      this._payment_id,
      this._note);

  DateTime get date => _date;
}
