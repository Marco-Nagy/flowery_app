// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseDto _$CartResponseDtoFromJson(Map<String, dynamic> json) =>
    CartResponseDto(
      json['message'] as String?,
      (json['numOfCartItems'] as num?)?.toInt(),
      json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseDtoToJson(CartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
      json['_id'] as String?,
      json['user'] as String?,
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CartItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['discount'] as num?)?.toInt(),
      (json['totalPrice'] as num?)?.toInt(),
      (json['totalPriceAfterDiscount'] as num?)?.toDouble(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'discount': instance.discount,
      'totalPrice': instance.totalPrice,
      'totalPriceAfterDiscount': instance.totalPriceAfterDiscount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CartItemsDto _$CartItemsDtoFromJson(Map<String, dynamic> json) => CartItemsDto(
      json['product'] == null
          ? null
          : CartItemProductDto.fromJson(
              json['product'] as Map<String, dynamic>),
      (json['price'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['_id'] as String?,
    );

Map<String, dynamic> _$CartItemsDtoToJson(CartItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

CartItemProductDto _$CartItemProductDtoFromJson(Map<String, dynamic> json) =>
    CartItemProductDto(
      json['_id'] as String?,
      json['title'] as String?,
      json['slug'] as String?,
      json['description'] as String?,
      json['imgCover'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['price'] as num?)?.toInt(),
      (json['priceAfterDiscount'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['category'] as String?,
      json['occasion'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
      (json['sold'] as num?)?.toInt(),
      (json['discount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartItemProductDtoToJson(CartItemProductDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'sold': instance.sold,
      'discount': instance.discount,
    };
