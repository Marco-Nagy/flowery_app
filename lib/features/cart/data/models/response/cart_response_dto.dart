import 'package:json_annotation/json_annotation.dart';

part 'cart_response_dto.g.dart';

@JsonSerializable()
class CartResponseDto {
  final String? message;
  final int? numOfCartItems;
  final CartDto? cart;

  CartResponseDto(this.message, this.numOfCartItems, this.cart);

  factory CartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartResponseDtoFromJson(json);

}

@JsonSerializable()
class CartDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<CartItemsDto?>? cartItems;
  final int? discount;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  CartDto(
      this.id,
      this.user,
      this.cartItems,
      this.discount,
      this.totalPrice,
      this.totalPriceAfterDiscount,
      this.createdAt,
      this.updatedAt,
      this.v);

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

}

@JsonSerializable()
class CartItemsDto {
  final CartItemProductDto? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  CartItemsDto(
      this.product, this.price, this.quantity, this.id);

  factory CartItemsDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemsDtoFromJson(json);

}

@JsonSerializable()
class CartItemProductDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String?>? images;
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

  CartItemProductDto(
      this.id,
      this.title,
      this.slug,
      this.description,
      this.imgCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity,
      this.category,
      this.occasion,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.sold,
      this.discount,
);

  factory CartItemProductDto.fromJson(
          Map<String, dynamic> json) =>
      _$CartItemProductDtoFromJson(json);


}
