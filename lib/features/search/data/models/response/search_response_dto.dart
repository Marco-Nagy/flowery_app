import 'package:json_annotation/json_annotation.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDto {
  final String? message;
  final List<SearchResponseDtoProducts?>? products;

  SearchResponseDto(this.message, this.products);

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoToJson(this);
}

@JsonSerializable()
class SearchResponseDtoProducts {
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

  SearchResponseDtoProducts(
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
  );

  factory SearchResponseDtoProducts.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoProductsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoProductsToJson(this);
}
