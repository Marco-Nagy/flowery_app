import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddProductToCartRequestDto {
  final String? product;
  final int? quantity;

  AddProductToCartRequestDto({this.product, this.quantity});



  Map<String, dynamic> toJson() => _$AddProductToCartRequestDtoToJson(this);
}
