class SearchSuggestionsModel{
  String? name;
  int? productId;

  SearchSuggestionsModel({this.name, this.productId});

  SearchSuggestionsModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    productId = json['productId'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'productId': productId,
    };
  }
}