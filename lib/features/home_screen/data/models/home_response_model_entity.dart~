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
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  HomeResponseModelOccasionsEntity(this.id, this.name, this.slug, this.image,
      this.createdAt, this.updatedAt);

  factory HomeResponseModelOccasionsEntity.fromJson(
          Map<String, dynamic> json) =>
      _$HomeResponseModelOccasionsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeResponseModelOccasionsEntityToJson(this);
}
