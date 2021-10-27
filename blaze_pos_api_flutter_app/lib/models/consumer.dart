class ConsumerUser {
  String _cuid = "";
  int _created = 0;
  int _modified = 0;
  bool _deleted = false;
  bool _updated = false;
  String _companyId = "";
  String _email = "";
  String _password = "";
  String _firstName = "";
  String _lastName = "";
  String _middleName = "";
  int _dob = 0;
  String _primaryPhone = "";
  String _cpn = "";
  bool _textOptIn = false;
  bool _emailOptIn = false;
  bool _medical = false;
  int _sex = 2;
  String _marketingSource = "";
  String _sourceCompanyId = "";
  String verifyMethod = "";
  bool _active = false;
  bool _verified = false;

  get cuid => this._cuid;

 set cuid( value) => this._cuid = value;

  get created => this._created;

 set created( value) => this._created = value;

  get modified => this._modified;

 set modified( value) => this._modified = value;

  get deleted => this._deleted;

 set deleted( value) => this._deleted = value;

  get updated => this._updated;

 set updated( value) => this._updated = value;

  get companyId => this._companyId;

 set companyId( value) => this._companyId = value;

  get email => this._email;

 set email( value) => this._email = value;

  get password => this._password;

 set password( value) => this._password = value;

  get firstName => this._firstName;

 set firstName( value) => this._firstName = value;

  get lastName => this._lastName;

 set lastName( value) => this._lastName = value;

  get middleName => this._middleName;

 set middleName( value) => this._middleName = value;

  get dob => this._dob;

 set dob( value) => this._dob = value;

  get primaryPhone => this._primaryPhone;

 set primaryPhone( value) => this._primaryPhone = value;

  get cpn => this._cpn;

 set cpn( value) => this._cpn = value;

  get textOptIn => this._textOptIn;

 set textOptIn( value) => this._textOptIn = value;

  get emailOptIn => this._emailOptIn;

 set emailOptIn( value) => this._emailOptIn = value;

  get medical => this._medical;

 set medical( value) => this._medical = value;

  get sex => this._sex;

 set sex( value) => this._sex = value;

  get marketingSource => this._marketingSource;

 set marketingSource( value) => this._marketingSource = value;

  get sourceCompanyId => this._sourceCompanyId;

 set sourceCompanyId( value) => this._sourceCompanyId = value;

  get getVerifyMethod => this.verifyMethod;

 set setVerifyMethod( verifyMethod) => this.verifyMethod = verifyMethod;

  get active => this._active;

 set active( value) => this._active = value;

  get verified => this._verified;

 set verified( value) => this._verified = value;

  ConsumerUser({
    id="",
    created=0,
    modified=0,
    deleted=false,
    updated=false,
    companyId="",
    email="",
    password="",
    firstName="",
    lastName="",
    middleName="",
    dob=0,
    primaryPhone="",
    cpn="",
    textOptIn=false,
    emailOptIn=false,
    medical=false,
    sex=2,
    marketingSource="",
    sourceCompanyId="",
    verfiyMethod="",
    active=false,
    verified=false,
  }) {
    this._cuid = id;
    this._created = created;
    this._modified = modified;
    this._deleted = deleted;
    this._updated = updated;
    this._companyId = companyId;
    this._email = email;
    this._password = password;
    this._firstName = firstName;
    this._lastName = lastName;
    this._middleName = middleName;
    this._dob = dob;
    this._primaryPhone = primaryPhone;
    this._cpn = cpn;
    this._textOptIn = textOptIn;
    this._emailOptIn = emailOptIn;
    this._medical = medical;
    this._sex = sex;
    this._marketingSource = marketingSource;
    this._sourceCompanyId = sourceCompanyId;
    this.verifyMethod = verifyMethod;
    this._active = active;
    this._verified = verified;
  }

  factory ConsumerUser.fromJson(Map<String, dynamic> json) {
    return ConsumerUser(
      id: json['id'] as String,
      created: json['created'] == null ? 0 : json['created'] as int,
      modified: json['modified'] == null ? 0 : json['modified'] as int,
      deleted: json['deleted'] == null ? false : json['deleted'] as bool,
      updated: json['updated'] == null ? false : json['updated'] as bool,
      companyId: json['companyId'] == null ? "" : json['companyId'] as String,
      email: json['email'] == null ? "" : json['email'] as String,
      password: json['password'] == null ? "" : json['password'] as String,
      firstName: json['firstName'] == null ? "" : json['firstName'] as String,
      lastName: json['lastName'] == null ? "" : json['lastName'] as String,
      middleName: json['middleName'] == null ? "" : json['middleName'] as String,
      dob: json['dob'] == null ? 0 : json['dob'] as int,
      primaryPhone: json['primarPhone'] == null ? "" : json['primaryPhone'] as String,
      cpn: json['cpn'] == null ? "" : json['cpn'] as String,
      textOptIn: json['textOptIn'] == null ? false : json['textOptIn'] as bool,
      emailOptIn: json['emailOptIn'] == null ? false : json['emailOptIn'] as bool,
      medical: json['medical'] == null ? false : json['medical'] as bool,
      sex: json['sex'] == null ? 2 : json['sex'] as int,
      marketingSource: json['marketingSource'] == null ? "" : json['marketingSource'] as String,
      sourceCompanyId: json['sourceCompanyId'] == null ? "" : json['sourceCompanyId'] as String,
      verfiyMethod: json['verifyMethod'] == null ? "" : json['verifyMethod'] as String,
      active: json['active'] == null ? false : json['active'] as bool,
      verified: json['verified'] == null ? false : json['verified'] as bool,
    );
  }
}
