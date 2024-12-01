import 'package:json_annotation/json_annotation.dart';

part 'update_cart_product_quantity_request_dto.g.dart';

@JsonSerializable()
class UpdateCartProductQuantityRequestDto {
  final int? quantity;

  UpdateCartProductQuantityRequestDto({this.quantity});


  Map<String, dynamic> toJson() =>
      _$UpdateCartProductQuantityRequestDtoToJson(this);
}
