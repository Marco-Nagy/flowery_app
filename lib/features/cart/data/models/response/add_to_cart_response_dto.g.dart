// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseDto _$AddToCartResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseDto(
      json['message'] as String?,
      (json['numOfCartItems'] as num?)?.toInt(),
      json['cart'] == null
          ? null
          : AddToCartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToCartResponseDtoToJson(
        AddToCartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };
AddToCartDto _$AddToCartDtoFromJson(Map<String, dynamic> json) => AddToCartDto(
      json['_id'] as String?,
      json['user'] as String?,
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddToCartItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num?)?.toInt(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddToCartDtoToJson(AddToCartDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
AddToCartItemsDto _$AddToCartItemsDtoFromJson(Map<String, dynamic> json) =>
    AddToCartItemsDto(
      json['product'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['_id'] as String?,
    );
