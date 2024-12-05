// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OderDetail _$OderDetailFromJson(Map<String, dynamic> json) => OderDetail(
      id: json['_id'] as String?,
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OderDetailToJson(OderDetail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['_id'] as String?,
      orderPrice: json['orderPrice'] as num?,
      discountedOrderPrice: json['discountedOrderPrice'] as num?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      status: json['status'] as String?,
      paymentProvider: json['paymentProvider'] as String?,
      paymentId: json['paymentId'] as String?,
      isPaymentDone: json['isPaymentDone'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as num?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'orderPrice': instance.orderPrice,
      'discountedOrderPrice': instance.discountedOrderPrice,
      'coupon': instance.coupon,
      'customer': instance.customer,
      'items': instance.items,
      'address': instance.address,
      'status': instance.status,
      'paymentProvider': instance.paymentProvider,
      'paymentId': instance.paymentId,
      'isPaymentDone': instance.isPaymentDone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['_id'] as String?,
      quantity: json['quantity'] as num?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      '_id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
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
      // subImages: (json['subImages'] as List<dynamic>?)
      //     ?.map((e) => SubImages.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      iV: json['iV'] as num?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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
      'iV': instance.iV,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

SubImages _$SubImagesFromJson(Map<String, dynamic> json) => SubImages();

Map<String, dynamic> _$SubImagesToJson(SubImages instance) =>
    <String, dynamic>{};

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

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'country': instance.country,
      'pincode': instance.pincode,
      'state': instance.state,
    };
