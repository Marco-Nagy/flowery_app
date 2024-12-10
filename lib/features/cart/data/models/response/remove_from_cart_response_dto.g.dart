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

CartItemsResponse _$CartItemsResponseFromJson(Map<String, dynamic> json) =>
    CartItemsResponse(
      json['product'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['_id'] as String?,
    );
