class Service {
  int _serviceID;
  String _salonID;
  bool _isMale;
  bool _isFemale;
  bool _isChildren;
  String _serviceName;
  int _price; //in lk rupeese
  int _duration; //in  mins
  String _serviceCategory;

  bool _isAdd = false; //to add to cart

  Service(
    this._serviceID,
    this._salonID,
    this._isMale,
    this._isFemale,
    this._isChildren,
    this._serviceName,
    this._price,
    this._duration,
    this._serviceCategory,
  );

  int get serviceID => _serviceID;

  set serviceID(int value) {
    _serviceID = value;
  }

  String get salonID => _salonID;

  String get serviceCategory => _serviceCategory;

  set serviceCategory(String value) {
    _serviceCategory = value;
  }

  int get duration => _duration;

  set duration(int value) {
    _duration = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get serviceName => _serviceName;

  set serviceName(String value) {
    _serviceName = value;
  }

  bool get isChildren => _isChildren;

  set isChildren(bool value) {
    _isChildren = value;
  }

  bool get isFemale => _isFemale;

  set isFemale(bool value) {
    _isFemale = value;
  }

  bool get isMale => _isMale;

  set isMale(bool value) {
    _isMale = value;
  }

  set salonID(String value) {
    _salonID = value;
  }
}
