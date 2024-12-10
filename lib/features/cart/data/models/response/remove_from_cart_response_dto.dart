import 'package:json_annotation/json_annotation.dart';

part 'remove_from_cart_response_dto.g.dart';

@JsonSerializable()
class RemoveFromCartResponseDto {
  final String? message;
  final int? numOfCartItems;
  final RemoveFromCartResponse? cart;

  RemoveFromCartResponseDto(this.message, this.numOfCartItems, this.cart);

  factory RemoveFromCartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromCartResponseDtoFromJson(json);
}

@JsonSerializable()
class RemoveFromCartResponse {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<CartItemsResponse?>? cartItems;
  final int? totalPrice;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  RemoveFromCartResponse(this.id, this.user, this.cartItems, this.totalPrice,
      this.createdAt, this.updatedAt, this.v);

  factory RemoveFromCartResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromCartResponseFromJson(json);
}

@JsonSerializable()
class CartItemsResponse {
  final String? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  CartItemsResponse(this.product, this.price, this.quantity, this.id);

  factory CartItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemsResponseFromJson(json);
}
