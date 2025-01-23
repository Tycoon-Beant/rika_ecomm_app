import 'package:json_annotation/json_annotation.dart';
part 'orders_model.g.dart';

@JsonSerializable()
class Order {
  List<Orders>? orders;
  num? totalOrders;
  num? limit;

  Order({
    this.orders,
    this.totalOrders,
    this.limit,
  });

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}

@JsonSerializable()
class Orders {
  @JsonKey(name: "_id")
  String? id;
  num? orderPrice;
  num? discountedOrderPrice;
  Coupon? coupon;
  Customer? customer;
  Address? address;
  String? status;
  String? paymentProvider;
  String? paymentnum;
  String? paymentId;
  bool? isPaymentDone;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? totalOrderItems;

  Orders(
      {this.id,
      this.orderPrice,
      this.discountedOrderPrice,
      this.coupon,
      this.customer,
      this.address,
      this.status,
      this.paymentProvider,
      this.paymentId,
      this.isPaymentDone,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalOrderItems});

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}

@JsonSerializable()
class Coupon {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? couponCode;

  Coupon({this.id, this.name, this.couponCode});

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: "_id")
  String? id;
  String? username;
  String? email;

  Customer({this.id, this.username, this.email});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
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

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
