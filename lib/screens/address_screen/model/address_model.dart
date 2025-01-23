
import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressData {
  List<Addresses>? addresses;
  int? totalAddresses;


  AddressData(
      {this.addresses,
      this.totalAddresses,});


  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);    


}

@JsonSerializable()
class Addresses {
  @JsonKey(name: "_id")
  String? id;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? country;
  String? owner;
  String? pincode;
  String? state;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Addresses(
      {this.id,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.country,
      this.owner,
      this.pincode,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory Addresses.fromJson(Map<String, dynamic> json) => _$AddressesFromJson(json);

  // Addresses.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   addressLine1 = json['addressLine1'];
  //   addressLine2 = json['addressLine2'];
  //   city = json['city'];
  //   country = json['country'];
  //   owner = json['owner'];
  //   pincode = json['pincode'];
  //   state = json['state'];
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['addressLine1'] = this.addressLine1;
  //   data['addressLine2'] = this.addressLine2;
  //   data['city'] = this.city;
  //   data['country'] = this.country;
  //   data['owner'] = this.owner;
  //   data['pincode'] = this.pincode;
  //   data['state'] = this.state;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}