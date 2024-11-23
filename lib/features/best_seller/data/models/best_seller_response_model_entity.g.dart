// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_response_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponseModelEntity _$BestSellerResponseModelEntityFromJson(
        Map<String, dynamic> json) =>
    BestSellerResponseModelEntity(
      json['message'] as String?,
      (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BestSellerResponseModelBestSellerEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BestSellerResponseModelEntityToJson(
        BestSellerResponseModelEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'bestSeller': instance.bestSeller,
    };

BestSellerResponseModelBestSellerEntity
    _$BestSellerResponseModelBestSellerEntityFromJson(
            Map<String, dynamic> json) =>
        BestSellerResponseModelBestSellerEntity(
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
        );

Map<String, dynamic> _$BestSellerResponseModelBestSellerEntityToJson(
        BestSellerResponseModelBestSellerEntity instance) =>
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
    };
