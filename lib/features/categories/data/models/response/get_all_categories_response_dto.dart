import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_response_dto.g.dart';

@JsonSerializable()
class GetAllCategoriesResponseDto {
  final String? message;
  final GetAllCategoriesResponseDtoMetadata? metadata;
  final List<GetAllCategoriesResponseDtoCategories?>? categories;

  GetAllCategoriesResponseDto(this.message, this.metadata, this.categories);

  factory GetAllCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoriesResponseDtoToJson(this);
}

@JsonSerializable()
class GetAllCategoriesResponseDtoMetadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  GetAllCategoriesResponseDtoMetadata(
      this.currentPage, this.numberOfPages, this.limit);

  factory GetAllCategoriesResponseDtoMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseDtoMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllCategoriesResponseDtoMetadataToJson(this);
}

@JsonSerializable()
class GetAllCategoriesResponseDtoCategories {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  GetAllCategoriesResponseDtoCategories(this.id, this.name, this.slug,
      this.image, this.createdAt, this.updatedAt);

  factory GetAllCategoriesResponseDtoCategories.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseDtoCategoriesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllCategoriesResponseDtoCategoriesToJson(this);
}
