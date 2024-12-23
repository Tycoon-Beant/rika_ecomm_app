
import 'package:json_annotation/json_annotation.dart';
part 'coupons_model.g.dart';

@JsonSerializable()
class Coupon {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? couponCode;
  String? type;
  num? discountValue;
  num? minimumCartValue;

  Coupon(
      {this.id,
      this.name,
      this.couponCode,
      this.type,
      this.discountValue,
      this.minimumCartValue,
      });

      factory Coupon.fromJson(Map<String ,dynamic> json ) => _$CouponFromJson(json);
}