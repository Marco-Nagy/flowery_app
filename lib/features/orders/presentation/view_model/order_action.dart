sealed class OrderAction {}

class GetOrders extends OrderAction {
  final String orderState;
  GetOrders(this.orderState);
}