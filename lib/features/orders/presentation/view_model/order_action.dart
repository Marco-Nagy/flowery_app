sealed class OrderAction {}

class GetOrdersByUser extends OrderAction {
  final String userId;
  final String status;
  GetOrdersByUser(this.userId , this.status);
}