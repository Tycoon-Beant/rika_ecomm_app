// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOrders: json['totalOrders'] as num?,
      limit: json['limit'] as num?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orders': instance.orders,
      'totalOrders': instance.totalOrders,
      'limit': instance.limit,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      id: json['_id'] as String?,
      orderPrice: json['orderPrice'] as num?,
      discountedOrderPrice: json['discountedOrderPrice'] as num?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
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
      totalOrderItems: json['totalOrderItems'] as num?,
    )..paymentnum = json['paymentnum'] as String?;

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      '_id': instance.id,
      'orderPrice': instance.orderPrice,
      'discountedOrderPrice': instance.discountedOrderPrice,
      'coupon': instance.coupon,
      'customer': instance.customer,
      'address': instance.address,
      'status': instance.status,
      'paymentProvider': instance.paymentProvider,
      'paymentnum': instance.paymentnum,
      'paymentId': instance.paymentId,
      'isPaymentDone': instance.isPaymentDone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'totalOrderItems': instance.totalOrderItems,
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'couponCode': instance.couponCode,
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
