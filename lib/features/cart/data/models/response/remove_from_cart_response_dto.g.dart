// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_from_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveFromCartResponseDto _$RemoveFromCartResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RemoveFromCartResponseDto(
      json['message'] as String?,
      (json['numOfCartItems'] as num?)?.toInt(),
      json['cart'] == null
          ? null
          : RemoveFromCartResponse.fromJson(
              json['cart'] as Map<String, dynamic>),
    );


Map<String, dynamic> _$RemoveFromCartResponseDtoToJson(
        RemoveFromCartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };

RemoveFromCartResponse _$RemoveFromCartResponseFromJson(
        Map<String, dynamic> json) =>
    RemoveFromCartResponse(
      json['_id'] as String?,
      json['user'] as String?,
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CartItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num?)?.toInt(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RemoveFromCartResponseToJson(
        RemoveFromCartResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CartItemsResponse _$CartItemsResponseFromJson(Map<String, dynamic> json) =>
    CartItemsResponse(
      json['product'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['_id'] as String?,
    );


Map<String, dynamic> _$CartItemsResponseToJson(CartItemsResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
