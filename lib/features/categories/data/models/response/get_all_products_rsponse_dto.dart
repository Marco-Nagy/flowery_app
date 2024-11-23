import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_rsponse_dto.g.dart';

@JsonSerializable()
class GetAllProductsRsponseDto {
  final String? message;
  final List<GetAllProductsRsponseDtoProducts?>? products;

  GetAllProductsRsponseDto(this.message, this.products);

  factory GetAllProductsRsponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsRsponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsRsponseDtoToJson(this);
}

@JsonSerializable()
class GetAllProductsRsponseDtoProducts {
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

  GetAllProductsRsponseDtoProducts(
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

  factory GetAllProductsRsponseDtoProducts.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllProductsRsponseDtoProductsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllProductsRsponseDtoProductsToJson(this);
}
