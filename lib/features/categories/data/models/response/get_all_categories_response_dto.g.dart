// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponseDto _$GetAllCategoriesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponseDto(
      json['message'] as String?,
      json['metadata'] == null
          ? null
          : GetAllCategoriesResponseDtoMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetAllCategoriesResponseDtoCategories.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCategoriesResponseDtoToJson(
        GetAllCategoriesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'categories': instance.categories,
    };

GetAllCategoriesResponseDtoMetadata
    _$GetAllCategoriesResponseDtoMetadataFromJson(Map<String, dynamic> json) =>
        GetAllCategoriesResponseDtoMetadata(
          (json['currentPage'] as num?)?.toInt(),
          (json['numberOfPages'] as num?)?.toInt(),
          (json['limit'] as num?)?.toInt(),
        );

Map<String, dynamic> _$GetAllCategoriesResponseDtoMetadataToJson(
        GetAllCategoriesResponseDtoMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

GetAllCategoriesResponseDtoCategories
    _$GetAllCategoriesResponseDtoCategoriesFromJson(
            Map<String, dynamic> json) =>
        GetAllCategoriesResponseDtoCategories(
          json['_id'] as String?,
          json['name'] as String?,
          json['slug'] as String?,
          json['image'] as String?,
          json['createdAt'] as String?,
          json['updatedAt'] as String?,
        );

Map<String, dynamic> _$GetAllCategoriesResponseDtoCategoriesToJson(
        GetAllCategoriesResponseDtoCategories instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
