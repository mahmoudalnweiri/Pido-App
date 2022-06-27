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
  int? id;
  String? language;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? productId;

  ProductTranslate.fromJson(Map<String, dynamic> json){
    id = json['id'];
    language = json['language'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['productId'];
  }
}

class ProductImage{
  int? id;
  String? name;
  int? ismain;
  String? createdAt;
  String? updatedAt;
  int? productId;

  ProductImage.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    ismain = json['ismain'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['productId'];
  }
}