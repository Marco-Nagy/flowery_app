import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  final String? message;
  final int? numOfCartItems;
  final AddToCartDto? cart;

  AddToCartResponseDto(this.message, this.numOfCartItems, this.cart);

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
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  AddToCartDto(this.id, this.user, this.cartItems, this.totalPrice,
      this.createdAt, this.updatedAt, this.v);

  factory AddToCartDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartDtoFromJson(json);

}

@JsonSerializable()
class AddToCartItemsDto {
  final String? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  AddToCartItemsDto(this.product, this.price, this.quantity,
      this.id);

  factory AddToCartItemsDto.fromJson(
      Map<String, dynamic> json) =>
      _$AddToCartItemsDtoFromJson(json);


}
