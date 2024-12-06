

import 'package:json_annotation/json_annotation.dart';
import 'package:rika_ecomm_app/model/orders_model.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OderDetail {
  @JsonKey(name: "_id")
  String? id;
  Order? order;

  OderDetail({this.id, this.order});

  factory OderDetail.fromJson(Map<String,dynamic> json) => _$OderDetailFromJson(json);

}

@JsonSerializable()
class Order {
  @JsonKey(name: "_id")
  String? id;
  num? orderPrice;
  num? discountedOrderPrice;
  Coupon? coupon;
  Customer? customer;
  List<Items>? items;
  Address? address;
  String? status;
  String? paymentProvider;
  String? paymentId;
  bool? isPaymentDone;
  String? createdAt;
  String? updatedAt;
  num? iV;

  Order(
      {this.id,
      this.orderPrice,
      this.discountedOrderPrice,
      this.coupon,
      this.customer,
      this.items,
      this.address,
      this.status,
      this.paymentProvider,
      this.paymentId,
      this.isPaymentDone,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);

}

@JsonSerializable()
class Customer {
  @JsonKey(name: "_id")
  String? id;
  String? username;
  String? email;

  Customer({this.id, this.username, this.email});

  factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);

}

@JsonSerializable()
class Items {
  @JsonKey(name: "_id")
  String? id;
  num? quantity;
  Product? product;

  Items({this.id, this.quantity, this.product});
factory Items.fromJson(Map<String,dynamic> json) => _$ItemsFromJson(json);

}

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;
  String? category;
  String? description;
  MainImage? mainImage;
  String? name;
  String? owner;
  num? price;
  num? stock;
  num? iV;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.category,
      this.description,
      this.mainImage,
      this.name,
      this.owner,
      this.price,
      this.stock,
      this.iV,
      this.createdAt,
      this.updatedAt});

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);

}


@JsonSerializable()
class MainImage {
  String? url;
  String? localPath;
  @JsonKey(name: "_id")
  String? id;

  MainImage({this.url, this.localPath, this.id});

  factory MainImage.fromJson(Map<String,dynamic> json) => _$MainImageFromJson(json);

}

@JsonSerializable()
class Address {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? country;
  String? pincode;
  String? state;

  Address(
      {this.addressLine1,
      this.addressLine2,
      this.city,
      this.country,
      this.pincode,
      this.state});
factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
}