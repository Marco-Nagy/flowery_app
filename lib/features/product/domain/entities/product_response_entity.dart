import 'package:equatable/equatable.dart';

class ProductResponseEntity extends Equatable {
  final List<ProductEntity> products;

  ProductResponseEntity({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductEntity extends Equatable {
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

  ProductEntity({
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
  });

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        imgCover,
        images,
        price,
        priceAfterDiscount,
        quantity,
        category,
        occasion,
      ];
}
