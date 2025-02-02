import 'package:json_annotation/json_annotation.dart';

part 'order_response_dto.g.dart';

@JsonSerializable()
class OrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "orders")
  final List<OrdersDto>? orders;

  OrderResponseDto ({
    this.message,
    this.orders,
  });

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderResponseDtoToJson(this);
  }
}

@JsonSerializable()
class OrdersDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItemsDto>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;


  OrdersDto ({
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

  factory OrdersDto.fromJson(Map<String, dynamic> json) {
    return _$OrdersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersDtoToJson(this);
  }
}

@JsonSerializable()
class OrderItemsDto {
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  OrderItemsDto ({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });

  factory OrderItemsDto.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsDtoToJson(this);
  }
}

@JsonSerializable()
class ProductDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "id")
  final String? id;

  ProductDto ({
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

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDtoToJson(this);
  }
}


