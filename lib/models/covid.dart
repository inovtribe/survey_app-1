class Covid{
  int _id;
  String _teamNo;
  String _dateOfScreening;
  String _ACFHouseNo;
  String _address;
  String _headOfFamilyName;
  String _nameOfMemberUnderScreening;
  int _age;
  String _sex;
  String _mobileNo;
  String _havingAnyDisease;
  String _contactWithCovidPatient;
  String _difficultyInBreathing;
  String _foreignTravelHistory;
  String _countryName;
  String _indiaArrivalDate;
  String _stateTravelHistory;
  String _stateName;
  String _himachalArrivalDate;

  Covid(this._teamNo, this._dateOfScreening, this._ACFHouseNo,
    this._address, this._headOfFamilyName, this._nameOfMemberUnderScreening,
    this._age, this._sex, this._mobileNo, this._havingAnyDisease,
    this._contactWithCovidPatient, this._difficultyInBreathing,
    this._foreignTravelHistory, this._stateTravelHistory, [this._countryName, this._indiaArrivalDate,this._stateName, this._himachalArrivalDate]);

  Covid.withAllData(this._id, this._teamNo, this._dateOfScreening, this._ACFHouseNo,
    this._address, this._headOfFamilyName, this._nameOfMemberUnderScreening,
    this._age, this._sex, this._mobileNo, this._havingAnyDisease,
    this._contactWithCovidPatient, this._difficultyInBreathing,
    this._foreignTravelHistory, this._stateTravelHistory, [this._countryName, this._indiaArrivalDate,this._stateName, this._himachalArrivalDate]);

  String get himachalArrivalDate => _himachalArrivalDate;

  set himachalArrivalDate(String value) {
    _himachalArrivalDate = value;
  }

  String get stateName => _stateName;

  set stateName(String value) {
    _stateName = value;
  }

  String get stateTravelHistory => _stateTravelHistory;

  set stateTravelHistory(String value) {
    _stateTravelHistory = value;
  }

  String get indiaArrivalDate => _indiaArrivalDate;

  set indiaArrivalDate(String value) {
    _indiaArrivalDate = value;
  }

  String get countryName => _countryName;

  set countryName(String value) {
    _countryName = value;
  }

  String get foreignTravelHistory => _foreignTravelHistory;

  set foreignTravelHistory(String value) {
    _foreignTravelHistory = value;
  }

  String get difficultyInBreathing => _difficultyInBreathing;

  set difficultyInBreathing(String value) {
    _difficultyInBreathing = value;
  }

  String get contactWithCovidPatient => _contactWithCovidPatient;

  set contactWithCovidPatient(String value) {
    _contactWithCovidPatient = value;
  }

  String get havingAnyDisease => _havingAnyDisease;

  set havingAnyDisease(String value) {
    _havingAnyDisease = value;
  }

  String get mobileNo => _mobileNo;

  set mobileNo(String value) {
    _mobileNo = value;
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get nameOfMemberUnderScreening => _nameOfMemberUnderScreening;

  set nameOfMemberUnderScreening(String value) {
    _nameOfMemberUnderScreening = value;
  }

  String get headOfFamilyName => _headOfFamilyName;

  set headOfFamilyName(String value) {
    _headOfFamilyName = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get ACFHouseNo => _ACFHouseNo;

  set ACFHouseNo(String value) {
    _ACFHouseNo = value;
  }

  String get dateOfScreening => _dateOfScreening;

  set dateOfScreening(String value) {
    _dateOfScreening = value;
  }

  String get teamNo => _teamNo;

  set teamNo(String value) {
    _teamNo = value;
  }

  int get id => _id;


  //Convert Covid Object to Map Object
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map['id'] = _id;
    }
    map['teamNo'] = _teamNo;
    map['dateOfScreening'] = _dateOfScreening;
    map['ACFHouseNo'] = _ACFHouseNo;
    map['address'] = _address;
    map['headOfFamilyName'] = _headOfFamilyName;
    map['nameOfMemberUnderScreening'] = _nameOfMemberUnderScreening;
    map['age'] = _age;
    map['sex'] = _sex;
    map['mobileNo'] = _mobileNo;
    map['havingAnyDisease'] = _havingAnyDisease;
    map['contactWithCovidPatient'] = _contactWithCovidPatient;
    map['difficultyInBreathing'] = _difficultyInBreathing;
    map['foreignTravelHistory'] = _foreignTravelHistory;
    map['stateTravelHistory'] = _stateTravelHistory;
    map['countryName'] = _countryName;
    map['indiaArrivalDate'] = _indiaArrivalDate;
    map['stateName'] = _stateName;
    map['himachalArrivalDate'] = _himachalArrivalDate;

    return map;
  }

  //Extract CovidObject from Map Object
  Covid.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._teamNo = map['teamNo'];
    this._dateOfScreening = map['dateOfScreening'];
    this._ACFHouseNo = map['ACFHouseNo'];
    this._address = map['address'];
    this._headOfFamilyName = map['headOfFamilyName'];
    this._nameOfMemberUnderScreening = map['nameOfMemberUnderScreening'];
    this._age = map['age'];
    this._sex = map['sex'];
    this._mobileNo = map['mobileNo'];
    this._havingAnyDisease = map['havingAnyDisease'];
    this._contactWithCovidPatient = map['contactWithCovidPatient'];
    this._difficultyInBreathing = map['difficultyInBreathing'];
    this._foreignTravelHistory = map['foreignTravelHistory'];
    this._stateTravelHistory = map['stateTravelHistory'];
    this._countryName = map['countryName'];
    this._indiaArrivalDate = map['indiaArrivalDate'];
    this._stateName = map['stateName'];
    this._himachalArrivalDate = map['himachalArrivalDate'];
  }
}

