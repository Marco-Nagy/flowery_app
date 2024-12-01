class CartProductEntity {
  final String? id;
  final String? title;
  final String? imgCover;
  final int? price;
  final int? quantity;
  final int? cartItemQuantity;

  const CartProductEntity({
    this.id,
    this.title,
    this.imgCover,
    this.price,
    this.quantity,
    this.cartItemQuantity,
  });
}
