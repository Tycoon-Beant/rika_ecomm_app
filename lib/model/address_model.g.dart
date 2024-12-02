// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Addresses.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAddresses: (json['totalAddresses'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
      'totalAddresses': instance.totalAddresses,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      id: json['_id'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      owner: json['owner'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      '_id': instance.id,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'country': instance.country,
      'owner': instance.owner,
      'pincode': instance.pincode,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
