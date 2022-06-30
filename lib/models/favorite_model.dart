import 'package:pido_app/models/product_model.dart';

class FavoriteModel{
  List<FavoriteData> data = [];

  FavoriteModel.fromJson(List<dynamic> json){
    for(var item in json){
      data.add(FavoriteData.fromJson(item));
    }
  }
}

class FavoriteData{
  ProductModel? productData;
  FavoriteDetails? favorite;

  FavoriteData.fromJson(Map<String, dynamic> json){
    productData = ProductModel.fromJson(json);
    favorite = FavoriteDetails.fromJson(json['favorite']);
  }
}

class FavoriteDetails{
  int? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? productId;

  FavoriteDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    productId = json['productId'];
  }
}