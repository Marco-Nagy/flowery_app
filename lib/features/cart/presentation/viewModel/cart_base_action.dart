sealed class CartBaseAction {}

class AddToCartAction extends CartBaseAction {
  final String productId;

  AddToCartAction(this.productId);
}

class GetUserCartDataAction extends CartBaseAction {}

class UpdateQuantityAction extends CartBaseAction {
  final String productId;
  final int quantity;

  UpdateQuantityAction(
    this.productId,
    this.quantity,
  );
}

class ClearCartAction extends CartBaseAction {
  final String productId;

  ClearCartAction(this.productId);
}

class RemoveFromCartAction extends CartBaseAction {
  final String productId;

  RemoveFromCartAction(this.productId);
}

