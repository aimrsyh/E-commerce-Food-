class AddressModel {
  late int? _id;
  late String _addresstype;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    contactPersonNumber,
    address,
    latitude,
    longitude,
  }) {
    _id = id;
    _addresstype = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _longitude = longitude;
    _latitude = latitude;
    _address = address;
  }

  String get address => _address;
  String get addressType => _addresstype;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => _contactPersonNumber;
  String get latitude => _latitude;
  String get longitude => _longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addresstype = json["address_type"] ?? "";
    _contactPersonName = json["contact_person_name"] ?? "";
    _contactPersonNumber = json["contact_person_number"] ?? "";
    _address = json["address"] ?? "";
    _latitude = json["latitude"] ?? "";
    _longitude = json["longitude"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this._id;
    data['address_type'] = this._addresstype;
    data['contact_person_name'] = this._contactPersonName;
    data['contact_person_number'] = this._contactPersonNumber;
    data['address'] = this.address;
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    return data;
  }
}
