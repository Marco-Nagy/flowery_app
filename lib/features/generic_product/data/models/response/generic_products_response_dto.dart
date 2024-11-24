import 'package:json_annotation/json_annotation.dart';

part 'generic_products_response_dto.g.dart';

@JsonSerializable()
class GenericProductsResponseDto {
  final String? message;
  final List<ProductDto?>? products;

  GenericProductsResponseDto(this.message, this.products);

  factory GenericProductsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GenericProductsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenericProductsResponseDtoToJson(this);
}

@JsonSerializable()
class ProductDto{
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

  ProductDto(
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
      this.v);

  factory ProductDto.fromJson(
          Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDtoToJson(this);
}
