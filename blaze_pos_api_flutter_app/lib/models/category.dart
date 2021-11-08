class Category {
  String _cid = "";
  int _created = 0;
  int _modified = 0;
  bool _deleted = false;
  bool _updated = false;
  String _companyId = "";
  String _shopId = "";
  bool _dirty = false;
  String _name = "";
  bool _cannabis = false;
  String _unitType = "";
  bool _active = false;
  String _cannabisType = "";
  String _complianceId = "";
  late Photo _photo;
  get cid => this._cid;

  set cid(value) => this._cid = value;

  get created => this._created;

  set created(value) => this._created = value;

  get modified => this._modified;

  set modified(value) => this._modified = value;

  get deleted => this._deleted;

  set deleted(value) => this._deleted = value;

  get updated => this._updated;

  set updated(value) => this._updated = value;

  get companyId => this._companyId;

  set companyId(value) => this._companyId = value;

  get shopId => this._shopId;

  set shopId(value) => this._shopId = value;

  get dirty => this._dirty;

  set dirty(value) => this._dirty = value;

  get name => this._name;

  set name(value) => this._name = value;

  get cannabis => this._cannabis;

  set cannabis(value) => this._cannabis = value;

  get unitType => this._unitType;

  set unitType(value) => this._unitType = value;

  get active => this._active;

  set active(value) => this._active = value;

  get cannabisType => this._cannabisType;

  set cannabisType(value) => this._cannabisType = value;

  get complianceId => this._complianceId;

  set complianceId(value) => this._complianceId = value;

  get photo => this._photo;

  set photo(value) => this._photo = value;

  Category({
    cid = "",
    created = 0,
    modified = 0,
    deleted = false,
    updated = false,
    companyId = "",
    shopId = "",
    dirty = false,
    name = "",
    cannabis = false,
    unitType = "",
    active = false,
    cannabisType = "",
    complianceId = "",
    photo,
  }) {
    this._cid = cid;
    this._created = created;
    this._modified = modified;
    this._deleted = deleted;
    this._updated = updated;
    this._companyId = companyId;
    this._shopId = shopId;
    this._dirty = dirty;
    this._name = name;
    this._cannabis = cannabis;
    this._unitType = unitType;
    this._active = active;
    this._cannabisType = cannabisType;
    this._complianceId = complianceId;
    this._photo = photo == null ? Photo() : photo;
  }

  Map toJson() => {
        'id': this._cid,
        'created': this._created,
        'modified': this._modified,
        'deleted': this._deleted,
        'updated': this._updated,
        'companyId': this._companyId,
        'shopId': this._shopId,
        'dirty': this._dirty,
        'name': this._name,
        'cannabis': this._cannabis,
        'unitType': this._unitType,
        'active': this._active,
        'cannabisType': this._cannabisType,
        'complianceId': this._complianceId,
        'photo': this._photo.toJson(),
      };

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      cid: json['id'] as String,
      created: json['created'] == null ? 0 : json['created'] as int,
      modified: json['modified'] == null ? 0 : json['modified'] as int,
      deleted: json['deleted'] == null ? false : json['deleted'] as bool,
      updated: json['updated'] == null ? false : json['updated'] as bool,
      companyId: json['companyId'] == null ? "" : json['companyId'] as String,
      shopId: json['shopId'] == null ? "" : json['shopId'] as String,
      dirty: json['dirty'] == null ? false : json['dirty'] as bool,
      name: json['name'] == null ? "" : json['name'] as String,
      cannabis: json['cannabis'] == null ? false : json['cannabis'] as bool,
      unitType: json['unitType'] == null ? "" : json['unitType'] as String,
      active: json['active'] == null ? false : json['active'] as bool,
      cannabisType:
          json['cannabisType'] == null ? "" : json['cannabisType'] as String,
      complianceId:
          json['complianceId'] == null ? "" : json['complianceId'] as String,
      photo: json['photo'] == null ? Photo() : Photo.fromJson(json['photo']),
    );
  }
}

class Photo {
  String _pid = "";
  String _publicURL = "";
  get pid => this._pid;

  set pid(value) => this._pid = value;

  get publicURL => this._publicURL;

  set publicURL(value) => this._publicURL = value;

  Photo({id, publicUrl}) {
    if (id != null) {
      this._pid = id;
      this._publicURL = publicUrl;
    }
  }

  Map toJson() => {
        'id': this._pid,
        'publicURL': this._publicURL,
      };

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        id: json['id'] == null ? "" : json['id'] as String,
        publicUrl:
            json['publicURL'] == null ? "" : json['publicURL'] as String);
  }
}
