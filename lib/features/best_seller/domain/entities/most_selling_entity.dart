class MostSellingProducts {
  MostSellingProducts({
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? imgCover;
  final List<String?>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
}
