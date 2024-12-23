import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  Avatar? avatar;
  String? username;
  String? email;
  String? createdAt;

  User(
      {this.id,
      this.avatar,
      this.username,
      this.email,
      this.createdAt
      });

      factory User.fromJson(Map<String , dynamic> json ) => _$UserFromJson(json);


  // User.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
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

  factory Avatar.fromJson(Map<String , dynamic> json ) => _$AvatarFromJson(json);

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
