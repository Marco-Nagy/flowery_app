class GetAllProductsRsponseEntity {
  final List<GetAllProductsRsponseDtoProductsEntity?>? products;

  GetAllProductsRsponseEntity({this.products});
}

class GetAllProductsRsponseDtoProductsEntity {
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

  GetAllProductsRsponseDtoProductsEntity({
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
}
