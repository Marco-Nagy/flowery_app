// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_cart_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToCartRequestDto _$AddProductToCartRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AddProductToCartRequestDto(
      product: json['product'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddProductToCartRequestDtoToJson(
        AddProductToCartRequestDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
