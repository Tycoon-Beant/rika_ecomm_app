import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';


@JsonSerializable()
class Loginuser {
  User? user;
  String? accessToken;
  String? refreshToken;

  Loginuser({this.user, this.accessToken, this.refreshToken});
  factory Loginuser.fromJson(Map<String , dynamic> json) => _$LoginuserFromJson(json);

  // Loginuser.fromJson(Map<String, dynamic> json) {
  //   user = json['user'] != null ? new User.fromJson(json['user']) : null;
  //   accessToken = json['accessToken'];
  //   refreshToken = json['refreshToken'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   data['accessToken'] = this.accessToken;
  //   data['refreshToken'] = this.refreshToken;
  //   return data;
  // }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  Avatar? avatar;
  String? username;
  String? email;
  String? role;
  String? loginType;
  bool? isEmailVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.id,
      this.avatar,
      this.username,
      this.email,
      this.role,
      this.loginType,
      this.isEmailVerified,
      this.createdAt,
      this.updatedAt,
      this.iV});
      factory User.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);

  // User.fromJson(Map<String, dynamic> json) {
  //   id = json['_id'];
  //   avatar =
  //       json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
  //   username = json['username'];
  //   email = json['email'];
  //   role = json['role'];
  //   loginType = json['loginType'];
  //   isEmailVerified = json['isEmailVerified'];
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   if (this.avatar != null) {
  //     data['avatar'] = this.avatar!.toJson();
  //   }
  //   data['username'] = this.username;
  //   data['email'] = this.email;
  //   data['role'] = this.role;
  //   data['loginType'] = this.loginType;
  //   data['isEmailVerified'] = this.isEmailVerified;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}

@JsonSerializable()
class Avatar {
  String? url;
  String? localPath;
  @JsonKey(name: "_id")
  String? id;

  Avatar({this.url, this.localPath, this.id});

factory Avatar.fromJson(Map<String , dynamic> json) => _$AvatarFromJson(json);
  // Avatar.fromJson(Map<String, dynamic> json) {
  //   url = json['url'];
  //   localPath = json['localPath'];
  //   sId = json['_id'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['url'] = this.url;
  //   data['localPath'] = this.localPath;
  //   data['_id'] = this.sId;
  //   return data;
  // }
}