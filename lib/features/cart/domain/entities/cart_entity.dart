import 'cart_response_entity.dart';

class CartEntity {
  late int numOfCartItems;
  List<CartProductEntity> cartList;
  late num totalPrice;
  num discount;
  late num totalPriceAfterDiscount;

  CartEntity({
    required this.numOfCartItems,
    required this.cartList,
    required this.totalPrice,
    required this.discount,
    required this.totalPriceAfterDiscount,
  });
}
