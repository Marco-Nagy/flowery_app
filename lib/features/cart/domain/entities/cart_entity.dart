import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'cart_response_entity.dart';

class CartEntity extends Equatable {
  int numOfCartItems;
  List<CartProductEntity> cartList;
  int totalPrice;
  int discount;
  int totalPriceAfterDiscount;

  CartEntity({
    required this.numOfCartItems,
    required this.cartList,
    required this.totalPrice,
    required this.discount,
    required this.totalPriceAfterDiscount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        numOfCartItems,
        cartList,
        totalPrice,
        discount,
        totalPriceAfterDiscount,
      ];
}
