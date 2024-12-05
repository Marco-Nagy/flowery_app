class CartProductEntity {
  final String id;
  final String title;
  final String imgCover;
  final int price;
  late  int quantity;
  final int cartItemQuantity;

   CartProductEntity({
    required this.id,
    required this.title,
    required this.imgCover,
    required this.price,
    required this.quantity,
    required this.cartItemQuantity,
  });
}
