// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_orders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashOrdersResponseDto _$CashOrdersResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CashOrdersResponseDto(
      json['message'] as String?,
      json['order'] == null
          ? null
          : CashOrdersResponseOrderDto.fromJson(
              json['order'] as Map<String, dynamic>),
    );



CashOrdersResponseOrderDto _$CashOrdersResponseOrderDtoFromJson(
        Map<String, dynamic> json) =>
    CashOrdersResponseOrderDto(
      json['user'] as String?,
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrderItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num?)?.toInt(),
      json['paymentType'] as String?,
      json['isPaid'] as bool?,
      json['isDelivered'] as bool?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
    );


OrderItemsDto _$OrderItemsDtoFromJson(Map<String, dynamic> json) =>
    OrderItemsDto(
      json['product'] == null
          ? null
          : OrderItemsProductDto.fromJson(
              json['product'] as Map<String, dynamic>),
      (json['price'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['_id'] as String?,
    );



OrderItemsProductDto _$OrderItemsProductDtoFromJson(
        Map<String, dynamic> json) =>
    OrderItemsProductDto(
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
      (json['discount'] as num?)?.toInt(),
      (json['sold'] as num?)?.toInt(),
      json['id'] as String?,
    );

