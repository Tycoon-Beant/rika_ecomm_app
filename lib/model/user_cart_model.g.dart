// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCart _$UserCartFromJson(Map<String, dynamic> json) => UserCart(
      id: json['_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartTotal: (json['cartTotal'] as num?)?.toInt(),
      discountedTotal: (json['discountedTotal'] as num?)?.toInt(),
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCartToJson(UserCart instance) => <String, dynamic>{
      '_id': instance.id,
      'items': instance.items,
      'cartTotal': instance.cartTotal,
      'discountedTotal': instance.discountedTotal,
      'coupon': instance.coupon,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['_id'] as String?,
      coupon: json['coupon'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      '_id': instance.id,
      'coupon': instance.coupon,
      'product': instance.product,
      'quantity': instance.quantity,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      mainImage: json['mainImage'] == null
          ? null
          : MainImage.fromJson(json['mainImage'] as Map<String, dynamic>),
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      price: json['price'] as num?,
      stock: json['stock'] as num?,
      subImages: (json['subImages'] as List<dynamic>?)
          ?.map((e) => SubImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'mainImage': instance.mainImage,
      'name': instance.name,
      'owner': instance.owner,
      'price': instance.price,
      'stock': instance.stock,
      'subImages': instance.subImages,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

MainImage _$MainImageFromJson(Map<String, dynamic> json) => MainImage(
      url: json['url'] as String?,
      localPath: json['localPath'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$MainImageToJson(MainImage instance) => <String, dynamic>{
      'url': instance.url,
      'localPath': instance.localPath,
      '_id': instance.id,
    };

SubImage _$SubImageFromJson(Map<String, dynamic> json) => SubImage(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SubImageToJson(SubImage instance) => <String, dynamic>{
      'url': instance.url,
    };
