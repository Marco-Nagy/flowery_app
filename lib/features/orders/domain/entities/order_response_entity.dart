
class OrderResponseEntity {
  final String? message;
  final List<Orders>? orders;

  OrderResponseEntity({
    this.message,
    this.orders,
  });
}


class Orders {
  String? Id;
  String? user;
  List<OrderItems>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;

  Orders({
    this.Id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
  });

}


class OrderItems {
  Product? product;
  num? price;
  num? quantity;
  String? Id;

  OrderItems({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });
}


class Product {
  String? Id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? discount;
  num? sold;
  String? id;
  Product({
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.discount,
    this.sold,
    this.id,
  });
}