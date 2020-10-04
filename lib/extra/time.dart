class Time {
  String _salonId;
  int _day;
  String _openTime;
  String _closeTime;
  int _isOpen;

  Time(this._salonId, this._day, this._openTime, this._closeTime, this._isOpen);

  int get isOpen => _isOpen;

  set isOpen(int value) {
    _isOpen = value;
  }

  String get closeTime => _closeTime;

  set closeTime(String value) {
    _closeTime = value;
  }

  String get openTime => _openTime;

  set openTime(String value) {
    _openTime = value;
  }

  int get day => _day;

  set day(int value) {
    _day = value;
  }

  String get salonId => _salonId;

  set salonId(String value) {
    _salonId = value;
  }
}
