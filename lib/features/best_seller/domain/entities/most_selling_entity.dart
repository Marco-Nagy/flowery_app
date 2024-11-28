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

  String? id;
  String? title;
  String? description;
  String? imgCover;
  List<String?>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
}