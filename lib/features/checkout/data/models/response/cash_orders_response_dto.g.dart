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

Map<String, dynamic> _$CashOrdersResponseDtoToJson(
        CashOrdersResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

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

Map<String, dynamic> _$CashOrdersResponseOrderDtoToJson(
        CashOrdersResponseOrderDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

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

Map<String, dynamic> _$OrderItemsDtoToJson(OrderItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

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

Map<String, dynamic> _$OrderItemsProductDtoToJson(
        OrderItemsProductDto instance) =>
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
      'discount': instance.discount,
      'sold': instance.sold,
      'id': instance.iD,
    };
