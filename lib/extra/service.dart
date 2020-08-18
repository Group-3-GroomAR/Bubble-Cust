class Service {
  int _serviceID;
  String _salonID;
  int _isMale;
  int _isFemale;
  int _isChildren;
  String _serviceName;
  double _price; //in lk rupeese
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

  bool get isAdd => _isAdd;
  set isAdd(bool val) {
    _isAdd = val;
  }

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

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get serviceName => _serviceName;

  set serviceName(String value) {
    _serviceName = value;
  }

  int get isChildren => _isChildren;

  set isChildren(int value) {
    _isChildren = value;
  }

  int get isFemale => _isFemale;

  set isFemale(int value) {
    _isFemale = value;
  }

  int get isMale => _isMale;

  set isMale(int value) {
    _isMale = value;
  }

  set salonID(String value) {
    _salonID = value;
  }
}
