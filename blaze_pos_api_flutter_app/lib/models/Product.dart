class Product {
  String _pid = "";
  int _created = 0;
  int _modified = 0;
  bool _deleted = false;
  bool _updated = false;
  String _name = "";
  String _flowerType = "";
  double _unitPrice = 0.0;
  String _weightPerUnit = "";
  double _unitValue = 0.0;
  double _thc = 0.0;
  double _cbd = 0.0;
  Asset _assets = Asset();
  bool _inStock = false;
  String get id => this._pid;

  set id(String value) => this._pid = value;

  get created => this._created;

  set created(value) => this._created = value;

  get modified => this._modified;

  set modified(value) => this._modified = value;

  get thc => this._thc;

  set thc(value) => this._thc = value;

  get cbd => this._cbd;

  set cbd(value) => this._cbd = value;

  get deleted => this._deleted;

  set deleted(value) => this._deleted = value;

  get updated => this._updated;

  set updated(value) => this._updated = value;

  get name => this._name;

  set name(value) => this._name = value;

  get flowerType => this._flowerType;

  set flowerType(value) => this._flowerType = value;

  get unitPrice => this._unitPrice;

  set unitPrice(value) => this._unitPrice = value;

  get weightPerUnit => this._weightPerUnit;

  set weightPerUnit(value) => this._weightPerUnit = value;

  get unitValue => this._unitValue;

  set unitValue(value) => this._unitValue = value;

  get assets => this._assets;

  set assets(value) => this._assets = value;

  get inStock => this._inStock;

  set inStock(value) => this._inStock = value;

  get assetId => this._assets._aid;
  get assetpublicURL => this._assets._publicUrl;

  Product(
      {id="",
      created=0,
      modified=0,
      deleted=false,
      updated=false,
      name="",
      flowerType="",
      unitPrice=0.0,
      thc=0.0,
      cbd=0.0,
      weightPerUnit="",
      assets,
      inStock=false,
      unitValue=0.0}) {
    this._pid = id;
    this._created = created;
    this._modified = modified;
    this._assets = assets;
    this._name = name;
    this._inStock = inStock;
    this._thc = thc;
    this._cbd = cbd;
    this._unitPrice = unitPrice;
    this._unitValue = unitValue;
    this._weightPerUnit = weightPerUnit;
    this._updated = updated;
    this._deleted = deleted;
    this._flowerType = flowerType;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      created: json['created'] as int,
      modified: json['modified'] as int,
      deleted: json['deleted'] as bool,
      updated: json['updated'] as bool,
      name: json['name'] as String,
      flowerType: json['flowerType'] == null
          ? "" : json['flowerType'] as String,
      thc: json['thc'] as double,
      cbd: json['cbd'] as double,
      unitPrice: json['unitPrice'] as double,
      weightPerUnit: json['weightPerUnit'] as String,
      unitValue: json['unitValue'] as double,
      inStock: json['instock'] as bool,
      assets: json['assets'].length == 0
          ? Asset()
          : Asset.fromJson(json['assets'][0]),
    );
  }
}

class Asset {
  String _aid = "";
  String get aid => this._aid;

  set aid(String value) => this._aid = value;
  String _publicUrl = "";
  get publicUrl => this._publicUrl;

  set publicUrl(value) => this._publicUrl = value;

  Asset({id, publicUrl}) {
    if (id != null) {
      this._aid = id;
      this._publicUrl = publicUrl;
    }
  }

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
        id: json['id'] as String, publicUrl: json['publicURL'] as String);
  }
}
