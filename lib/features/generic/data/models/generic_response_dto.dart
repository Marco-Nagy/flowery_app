import 'package:json_annotation/json_annotation.dart';

part 'generic_response_dto.g.dart';
@JsonSerializable()
class GenericResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "categories")
  final List<ItemModel>? categories;
  @JsonKey(name: "occasions")
  final List<ItemModel>? occasions;

  GenericResponseDto ({
    this.message,
    this.metadata,
    this.categories,
    this.occasions,
  });

  factory GenericResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GenericResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenericResponseDtoToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class ItemModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  ItemModel ({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return _$ItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemModelToJson(this);
  }
}


