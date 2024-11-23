import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response_model_entity.g.dart';

@JsonSerializable()
class BestSellerResponseModelEntity {
  String? message;
  List<BestSellerResponseModelBestSellerEntity?>? bestSeller;

  BestSellerResponseModelEntity(this.message, this.bestSeller);

  factory BestSellerResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerResponseModelEntityToJson(this);
}

@JsonSerializable()
class BestSellerResponseModelBestSellerEntity {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String?>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  BestSellerResponseModelBestSellerEntity(
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
     );

  factory BestSellerResponseModelBestSellerEntity.fromJson(
          Map<String, dynamic> json) =>
      _$BestSellerResponseModelBestSellerEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BestSellerResponseModelBestSellerEntityToJson(this);
}
