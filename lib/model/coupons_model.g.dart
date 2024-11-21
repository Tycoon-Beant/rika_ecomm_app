// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      couponCode: json['couponCode'] as String?,
      type: json['type'] as String?,
      discountValue: json['discountValue'] as num?,
      minimumCartValue: json['minimumCartValue'] as num?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'couponCode': instance.couponCode,
      'type': instance.type,
      'discountValue': instance.discountValue,
      'minimumCartValue': instance.minimumCartValue,
    };
