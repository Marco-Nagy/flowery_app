import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  final String? message;
  final int? numOfCartItems;
  final AddToCartDto? cart;

  AddToCartResponseDto({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });

  factory AddToCartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseDtoFromJson(json);

}

@JsonSerializable()
class AddToCartDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<AddToCartItemsDto?>? cartItems;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;
  final int? discount;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  AddToCartDto({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddToCartDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartDtoFromJson(json);

}

@JsonSerializable()
class AddToCartItemsDto {
  final ProductDto? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  AddToCartItemsDto({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory AddToCartItemsDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartItemsDtoFromJson(json);

}

@JsonSerializable()
class ProductDto {
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final int? sold;
  final int? discount;
  final double? rateAvg;
  final int? rateCount;
  @JsonKey(name: 'id')
  final String? id;

  ProductDto({
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sold,
    required this.discount,
    required this.rateAvg,
    required this.rateCount,
    required this.id,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);







}
