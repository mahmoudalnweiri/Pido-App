class CartProductModel{
  int? id;
  int? count;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? productId;
  Product? product;
  
  CartProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    count = json['count'];
    totalPrice = json['totalPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    productId = json['productId'];
    product = Product.fromJson(json['product']);
  }
}

class Product{
  int? price;
  int? quantity;
  ProductTranslate? product_translate;
  ProductImage? product_image;
  
  Product.fromJson(Map<String, dynamic> json){
    price = json['price'];
    quantity = json['quantity'];
    product_translate = ProductTranslate.fromJson(json['product_translate']);
    product_image = ProductImage.fromJson(json['product_image']);
  }
}

class ProductTranslate{
  String? name;

  ProductTranslate.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}

class ProductImage{
  String? name;

  ProductImage.fromJson(Map<String, dynamic> json){
    name = json['name'];

  }
}