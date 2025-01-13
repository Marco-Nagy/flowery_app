import 'package:equatable/equatable.dart';

import 'cart_response_entity.dart';

class CartEntity extends Equatable {
  final int numOfCartItems;
  final List<CartProductEntity> cartList;
  final int totalPrice;
  final int discount;
  final int totalPriceAfterDiscount;

  const CartEntity({
    required this.numOfCartItems,
    required this.cartList,
    required this.totalPrice,
    required this.discount,
    required this.totalPriceAfterDiscount,
  });

  @override
  List<Object?> get props => [
        numOfCartItems,
        cartList,
        totalPrice,
        discount,
        totalPriceAfterDiscount,
      ];
}
