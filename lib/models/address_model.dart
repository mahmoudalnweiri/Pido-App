class AddressModel {
  int? id;
  String? area;
  String? street;
  String? house;
  int? isdefault;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? cityId;
  CityDetails? city;

  AddressModel({
    this.id,
    this.area,
    this.street,
    this.house,
    this.isdefault,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.cityId,
    this.city,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'];
    street = json['street'];
    house = json['house'];
    isdefault = json['isdefault'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    cityId = json['cityId'];
    city = CityDetails.fromJson(json['city']);
  }
}

class CityDetails {
  int? id;
  int? price;
  String? createdAt;
  String? updatedAt;
  CityTranslate? city_translate;

  CityDetails({
    this.id,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.city_translate,
  });

  CityDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    city_translate = CityTranslate.fromJson(json['city_translate']);
  }
}

class CityTranslate {
  String? name;

  CityTranslate({this.name});

  CityTranslate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
