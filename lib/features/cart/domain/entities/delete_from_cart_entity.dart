import 'package:equatable/equatable.dart';


class RemoveFromCartEntity extends Equatable {
  final int numOfCartItems;

  final int totalPrice;

  const RemoveFromCartEntity({
    required this.numOfCartItems,
    required this.totalPrice,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        numOfCartItems,
        totalPrice,

      ];
}
