class CityModel{
  int? id;
  String? name;

  CityModel({this.id, this.name});

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
    };
  }
}