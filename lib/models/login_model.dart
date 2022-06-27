class LoginUserMode{
  int? id;
  String? username;
  String? email;
  String? roles;
  String? accessToken;

  LoginUserMode({this.id, this.username, this.email, this.roles, this.accessToken});

  LoginUserMode.fromJson(Map<String, dynamic> json){
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