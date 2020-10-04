class Reservation {
  int _resID;
  String _salon_id;
  String customer_id;
  int _total;
  String _date;
  String _start_time;
  int _duration;
  String end_time;

  String _payment_id;
  String _note;

  int get resID => _resID;

  String get salon_id => _salon_id;

  set salon_id(String value) {
    _salon_id = value;
  } // String setDate() {
  //   var day = _date.day;
  //   var month = _date.month;
  //   var year = _date.year;

  //   var mydate =
  //       day.toString() + "/" + month.toString() + "/" + year.toString();

  //   return mydate;
  // }

  Reservation(
      this._resID,
      this._date,
      this._duration,
      this._start_time,
      this.end_time,
      this._total,
      this.customer_id,
      this._payment_id,
      this._note,
      this._salon_id);

  int get total => _total;

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  String get payment_id => _payment_id;

  set payment_id(String value) {
    _payment_id = value;
  }

  int get duration => _duration;

  set duration(int value) {
    _duration = value;
  }

  String get start_time => _start_time;

  set start_time(String value) {
    _start_time = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  set total(int value) {
    _total = value;
  }

// DateTime get date => _date;
}
