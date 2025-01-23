import 'package:json_annotation/json_annotation.dart';

part 'my_profile_model.g.dart';

@JsonSerializable()
class MyProfile {
  
@JsonKey(name: "_id")
  String? id;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNumber;
  String? owner;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyProfile(
      {this.id,
      this.firstName,
      this.lastName,
      this.countryCode,
      this.phoneNumber,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory MyProfile.fromJson(Map<String , dynamic> json) => _$MyProfileFromJson(json);
}
