import 'package:json_annotation/json_annotation.dart';

part 'cash_orders_response_dto.g.dart';

@JsonSerializable()
class CashOrdersResponseDto {
  final String? message;
  final CashOrdersResponseOrderDto? order;

  CashOrdersResponseDto(this.message, this.order);

  factory CashOrdersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CashOrdersResponseDtoFromJson(json);
}

@JsonSerializable()
class CashOrdersResponseOrderDto {
  final String? user;
  final List<OrderItemsDto?>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  @JsonKey(name: '_id')
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  CashOrdersResponseOrderDto(
      this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v);

  factory CashOrdersResponseOrderDto.fromJson(Map<String, dynamic> json) =>
      _$CashOrdersResponseOrderDtoFromJson(json);

}

@JsonSerializable()
class OrderItemsDto {
  final OrderItemsProductDto? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  OrderItemsDto(
      this.product, this.price, this.quantity, this.id);

  factory OrderItemsDto.fromJson(
          Map<String, dynamic> json) =>
      _$OrderItemsDtoFromJson(json);
}

@JsonSerializable()
class OrderItemsProductDto {
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
  final int? discount;
  final int? sold;
  @JsonKey(name: 'id')
  final String? iD;

  OrderItemsProductDto(
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
      this.discount,
      this.sold,
      this.iD);

  factory OrderItemsProductDto.fromJson(
          Map<String, dynamic> json) =>
      _$OrderItemsProductDtoFromJson(json);
}
