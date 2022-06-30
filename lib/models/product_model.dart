class ProductModel{
  int? id;
  int? price;
  int? offerprice;
  String? offerstart;
  String? offerend;
  String? sq;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  int? subcategoryId;
  ProductTranslate? product_translate;
  ProductImage? product_image;

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    offerprice = json['offerprice'];
    offerstart = json['offerstart'];
    offerend = json['offerend'];
    sq = json['sq'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['categoryId'];
    subcategoryId = json['subcategoryId'];
    product_translate = ProductTranslate.fromJson(json['product_translate']);
    product_image = ProductImage.fromJson(json['product_image']);
  }
}

class ProductTranslate{
  String? name;
  String? description;

  ProductTranslate.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
  }
}

class ProductImage{
  String? name;

  ProductImage.fromJson(Map<String, dynamic> json){
    name = json['name'];

  }
}