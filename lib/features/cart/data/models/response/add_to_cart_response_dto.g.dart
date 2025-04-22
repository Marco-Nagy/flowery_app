// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseDto _$AddToCartResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : AddToCartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

AddToCartDto _$AddToCartDtoFromJson(Map<String, dynamic> json) => AddToCartDto(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddToCartItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      totalPriceAfterDiscount:
          (json['totalPriceAfterDiscount'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );
AddToCartItemsDto _$AddToCartItemsDtoFromJson(Map<String, dynamic> json) =>
    AddToCartItemsDto(
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toInt(),
      priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      category: json['category'] as String?,
      occasion: json['occasion'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
      sold: (json['sold'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      rateAvg: (json['rateAvg'] as num?)?.toDouble(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
      id: json['id'] as String?,
    );