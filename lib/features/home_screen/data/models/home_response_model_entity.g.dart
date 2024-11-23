// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModelEntity _$HomeResponseModelEntityFromJson(
        Map<String, dynamic> json) =>
    HomeResponseModelEntity(
      json['message'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HomeResponseModelProductsEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HomeResponseModelBestSellerEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      (json['occasions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HomeResponseModelOccasionsEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseModelEntityToJson(
        HomeResponseModelEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'products': instance.products,
      'bestSeller': instance.bestSeller,
      'occasions': instance.occasions,
    };

HomeResponseModelProductsEntity _$HomeResponseModelProductsEntityFromJson(
        Map<String, dynamic> json) =>
    HomeResponseModelProductsEntity(
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

Map<String, dynamic> _$HomeResponseModelProductsEntityToJson(
        HomeResponseModelProductsEntity instance) =>
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

HomeResponseModelBestSellerEntity _$HomeResponseModelBestSellerEntityFromJson(
        Map<String, dynamic> json) =>
    HomeResponseModelBestSellerEntity(
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

Map<String, dynamic> _$HomeResponseModelBestSellerEntityToJson(
        HomeResponseModelBestSellerEntity instance) =>
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

HomeResponseModelOccasionsEntity _$HomeResponseModelOccasionsEntityFromJson(
        Map<String, dynamic> json) =>
    HomeResponseModelOccasionsEntity(
      json['_id'] as String?,
      json['name'] as String?,
      json['slug'] as String?,
      json['image'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$HomeResponseModelOccasionsEntityToJson(
        HomeResponseModelOccasionsEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
