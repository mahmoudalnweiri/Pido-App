class RegisterUserModel{
  bool? success;
  UserData? user;

  RegisterUserModel({this.success, this.user});

  RegisterUserModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    user = UserData.fromJson(json['user']);
  }
}

class UserData{
  int? id;
  String? username;
  String? email;
  String? roles;
  String? accessToken;

  UserData({this.id, this.username, this.email, this.roles, this.accessToken});

  UserData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'][0];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'username': username,
      'email': email,
      'roles': roles,
      'accessToken': accessToken,
    };
  }
}