class Shop {
  String _shopID;
  String _shopName;
  String _shopAddress;
  String _district;
  int _contact;
  String image =
      'https://www.48hourslogo.com/48hourslogo_data/2018/07/14/74963_1531515608.jpg';
  String _email;
  String _about;

  String get shopID => _shopID;

  set shopID(String value) {
    _shopID = value;
  }

  Shop(this._shopID, this._shopName, this._shopAddress, this._district);
  Shop.contact(this._shopID, this._shopName, this._shopAddress, this._district,
      this._contact, this._email, this._about);

  String get shopName => _shopName;

  set shopName(String value) {
    _shopName = value;
  }

  String get shopAddress => _shopAddress;

  set shopAddress(String value) {
    _shopAddress = value;
  }

  String get district => _district;

  set district(String value) {
    _district = value;
  }

  int get contact => _contact;

  set contact(int value) {
    _contact = value;
  }

  String get about => _about;

  set about(String value) {
    _about = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}
