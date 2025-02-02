import 'package:flowery_e_commerce/features/orders/data/models/order_response_dto.dart';
import 'package:flowery_e_commerce/features/orders/domain/entities/order_response_entity.dart';


class OrderMapper {
  static Orders _toOrderEntity(orderDto) {
    return Orders(
      Id: orderDto.Id,
      user: orderDto.user,
      orderItems: (orderDto.orderItems as List<OrderItemsDto>?)?.map((item) => _toOrderItemEntity(item)).toList(),
      totalPrice: orderDto.totalPrice,
      paymentType: orderDto.paymentType,
      isPaid: orderDto.isPaid,
      isDelivered: orderDto.isDelivered,
      state: orderDto.state,
      createdAt: orderDto.createdAt,
      updatedAt: orderDto.updatedAt,
      orderNumber: orderDto.orderNumber,
    );
  }

  static OrderItems _toOrderItemEntity(OrderItemsDto itemDto) {
    return OrderItems(
      product: itemDto.product != null ? _toProductEntity(itemDto.product!) : null,
      price: itemDto.price,
      quantity: itemDto.quantity,
      Id: itemDto.Id,
    );
  }

  static Product _toProductEntity(ProductDto productDto) {
    return Product(
      Id: productDto.Id,
      title: productDto.title,
      slug: productDto.slug,
      description: productDto.description,
      imgCover: productDto.imgCover,
      images: productDto.images,
      price: productDto.price,
      priceAfterDiscount: productDto.priceAfterDiscount,
      quantity: productDto.quantity,
      category: productDto.category,
      occasion: productDto.occasion,
      createdAt: productDto.createdAt,
      updatedAt: productDto.updatedAt,
      discount: productDto.discount,
      sold: productDto.sold,
      id: productDto.id,
    );
  }

  static OrderResponseEntity toEntity(OrderResponseDto response) {
    return OrderResponseEntity(
      message: response.message,
      orders: response.orders!.map((orderDto) => _toOrderEntity(orderDto)).toList(),
    );
  }
}
