class PromoCodeModel{
  int? id;
  String? code;
  int? percent;

  PromoCodeModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    percent = json['percent'];
  }
}