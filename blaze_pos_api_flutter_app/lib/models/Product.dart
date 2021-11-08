import 'package:blaze_pos_api_flutter_app/models/category.dart';

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
  String _companyId = "";
  String _shopId = "";
  String _categoryId = "";
  String _sku = "";
  String _description = "";
  bool _active = false;
  String _brandId = "";
  String _taxType = "";
  String _taxOrder = "";
  String get companyId => this._companyId;
  late Category _category;

  get category => this._category;
  set companyId(String value) => this._companyId = value;

  get shopId => this._shopId;

  set shopId(value) => this._shopId = value;

  get categoryId => this._categoryId;

  set categoryId(value) => this._categoryId = value;

  get sku => this._sku;

  set sku(value) => this._sku = value;

  get description => this._description;

  set description(value) => this._description = value;

  get active => this._active;

  set active(value) => this._active = value;

  get brandId => this._brandId;

  set brandId(value) => this._brandId = value;

  get taxType => this._taxType;

  set taxType(value) => this._taxType = value;

  get taxOrder => this._taxOrder;

  set taxOrder(value) => this._taxOrder = value;

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

  Product({
    id = "",
    created = 0,
    modified = 0,
    deleted = false,
    updated = false,
    name = "",
    flowerType = "",
    unitPrice = 0.0,
    thc = 0.0,
    cbd = 0.0,
    weightPerUnit = "",
    assets,
    inStock = false,
    unitValue = 0.0,
    companyId = "",
    shopId = "",
    categoryId = "",
    sku = "",
    description = "",
    active = false,
    brandId = "",
    taxType = "",
    taxOrder = "",
    category,
  }) {
    this._pid = id;
    this._created = created;
    this._modified = modified;
    this._assets = assets == null ? Asset() : assets;
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
    this._companyId = companyId;
    this._shopId = shopId;
    this._categoryId = categoryId;
    this._sku = sku;
    this._description = description;
    this._active = active;
    this._brandId = brandId;
    this._taxType = taxType;
    this._taxOrder = taxOrder;
    this._category = category == null ? Category() : category;
  }

  Map toJson() => {
        'id': this._pid,
        'created': this._created,
        'modified': this._modified,
        'deleted': this._deleted,
        'updated': this._updated,
        'companyId': this._companyId,
        'name': this._name,
        'flowerType': this._flowerType,
        'thc': this._thc,
        'cbd': this._cbd,
        'unitPrice': this._unitPrice,
        'weightPerUnit': this._weightPerUnit,
        'unitValue': this._unitValue,
        'instock': this._inStock,
        'categoryId': this.categoryId,
        'sku': this._sku,
        'description': this._description,
        'active': this._active,
        'brandId': this._brandId,
        'taxType': this._taxType,
        'taxOrder': this._taxOrder,
        'assets': List.filled(1, this._assets),
        'category': this._category.toJson(),
      };

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      created: json['created'] == null ? 0 : json['created'] as int,
      modified: json['modified'] == null ? 0 : json['modified'] as int,
      deleted: json['deleted'] == null ? false : json['deleted'] as bool,
      updated: json['updated'] == null ? false : json['updated'] as bool,
      name: json['name'] == null ? "" : json['name'] as String,
      flowerType:
          json['flowerType'] == null ? "" : json['flowerType'] as String,
      thc: json['thc'] == null ? 0.0 : json['thc'] as double,
      cbd: json['cbd'] == null ? 0.0 : json['cbd'] as double,
      unitPrice: json['unitPrice'] == null ? 0.0 : json['unitPrice'] as double,
      weightPerUnit:
          json['weightPerUnit'] == null ? "" : json['weightPerUnit'] as String,
      unitValue: json['unitValue'] == null ? 0.0 : json['unitValue'] as double,
      inStock: json['instock'] == null ? false : json['instock'] as bool,
      assets: json['assets'].length == 0
          ? Asset()
          : Asset.fromJson(json['assets'][0]),
      companyId: json['companyId'] == null ? "" : json['companyId'] as String,
      shopId: json['shopId'] == null ? "" : json['shopId'] as String,
      categoryId:
          json['categoryId'] == null ? "" : json['categoryId'] as String,
      sku: json['sku'] == null ? "" : json['sku'] as String,
      description:
          json['description'] == null ? "" : json['description'] as String,
      active: json['active'] == null ? false : json['active'] as bool,
      brandId: json['brandId'] == null ? "" : json['brandId'] as String,
      taxType: json['taxType'] == null ? "" : json['taxType'] as String,
      taxOrder: json['taxOrder'] == null ? "" : json['taxOrder'] as String,
      category: json['category'] == null
          ? Category()
          : Category.fromJson(json['category']),
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

  Map toJson() => {
        'id': this._aid,
        'publicURL': this._publicUrl,
      };

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
        id: json['id'] as String, publicUrl: json['publicURL'] as String);
  }
}
