import 'package:json_annotation/json_annotation.dart';
import 'package:rika_ecomm_app/model/coupons_model.dart';

part 'user_cart_model.g.dart';

@JsonSerializable()
class UserCart {
  @JsonKey(name: "_id")
  String? id;
  List<Item>? items;
  int? cartTotal;
  int? discountedTotal;
  Coupon? coupon;

  int? get itemCount => items?.map((e)=> e.quantity).fold(0, (e,t)=> (e ?? 0) +(t ?? 1));
    
  UserCart({this.id, this.items, this.cartTotal, this.discountedTotal, this.coupon});

 factory UserCart.fromJson(Map<String, dynamic> json) => _$UserCartFromJson(json);

 
}

@JsonSerializable()
class Item {
  @JsonKey(name: "_id")
  String? id;
  String? coupon;
  Product? product;
  int? quantity;

  Item({this.id, this.coupon, this.product, this.quantity});

 factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
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
  List<SubImage>? subImages;
  DateTime? createdAt;

  Product(
      {this.id,
      this.category,
      this.description,
      this.mainImage,
      this.name,
      this.owner,
      this.price,
      this.stock,
      this.subImages,
      this.createdAt,});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}


@JsonSerializable()
class MainImage {
  String? url;
  String? localPath;
  @JsonKey(name: "_id")
  String? id;

  MainImage({this.url, this.localPath, this.id});

  factory MainImage.fromJson(Map<String, dynamic> json) => _$MainImageFromJson(json);
}

@JsonSerializable()
class SubImage {
  String? url;

  SubImage({this.url});

  factory SubImage.fromJson(Map<String, dynamic> json) => _$SubImageFromJson(json);
}