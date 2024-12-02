import 'package:json_annotation/json_annotation.dart';

part 'home_response_model_entity.g.dart';

@JsonSerializable()
class HomeResponseModelEntity {
  String? message;
  List<HomeResponseModelProductsEntity?>? products;
  List<HomeResponseModelBestSellerEntity?>? bestSeller;
  List<HomeResponseModelOccasionsEntity?>? occasions;

  HomeResponseModelEntity(
      this.message, this.products, this.bestSeller, this.occasions);

  factory HomeResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseModelEntityToJson(this);
}

@JsonSerializable()
class HomeResponseModelProductsEntity {
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
  final  int? v;


  HomeResponseModelProductsEntity(
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

  factory HomeResponseModelProductsEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelProductsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeResponseModelProductsEntityToJson(this);
}

@JsonSerializable()
class HomeResponseModelBestSellerEntity {
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

  HomeResponseModelBestSellerEntity(
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

  factory HomeResponseModelBestSellerEntity.fromJson(
          Map<String, dynamic> json) =>
      _$HomeResponseModelBestSellerEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeResponseModelBestSellerEntityToJson(this);
}

@JsonSerializable()
class HomeResponseModelOccasionsEntity {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  HomeResponseModelOccasionsEntity(this.id, this.name, this.slug, this.image,
      this.createdAt, this.updatedAt);

  factory HomeResponseModelOccasionsEntity.fromJson(
          Map<String, dynamic> json) =>
      _$HomeResponseModelOccasionsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeResponseModelOccasionsEntityToJson(this);
}
