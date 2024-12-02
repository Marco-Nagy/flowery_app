import 'cart_response_entity.dart';

class CartEntity {
  int numOfCartItems;
  List<CartProductEntity> cartList;
  num totalPrice;
  num discount;
  num totalPriceAfterDiscount;

  CartEntity({
    required this.numOfCartItems,
    required this.cartList,
    required this.totalPrice,
    required this.discount,
    required this.totalPriceAfterDiscount,
  });
}
