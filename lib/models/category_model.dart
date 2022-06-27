class CategoryModel{
  int? categoryId;
  String? name;
  CategoryData? category;

  CategoryModel({this.categoryId, this.name, this.category});

  CategoryModel.fromJson(Map<String, dynamic> json){
    categoryId = json['categoryId'];
    name = json['name'];
    category = CategoryData.fromJson(json['category']);
  }

  Map<String, dynamic> toMap(){
    return {
      'categoryId': categoryId,
      'name': name,
      'category': category,
    };
  }

}

class CategoryData{
  int? id;
  String? image;
  String? type;

  CategoryData({this.id, this.image, this.type});

  CategoryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'image': image,
      'type': type,
    };
  }
}