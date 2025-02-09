import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

class TrackOrderEntity extends Equatable {
  final OrderData? orders;
  final Driver? driver;

  const TrackOrderEntity({this.driver, this.orders});

  @override
  
  List<Object?> get props => [driver, orders];
}

class OrderData extends Equatable {
  final String? id;
  final UserData? user;
  final List<OrderItems?>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final Store? store;

  const OrderData(
      {this.id,
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
      this.store});

  @override
  
  List<Object?> get props => [
        id,
        user,
        orderItems,
        totalPrice,
        paymentType,
        isPaid,
        isDelivered,
        state,
        createdAt,
        updatedAt,
        orderNumber,
        store
      ];
}

class UserData extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final Location? location;

  const UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.photo,
      this.phone,
      this.location});

  @override
  
  List<Object?> get props =>
      [id, firstName, lastName, email, gender, phone, location, photo];
}

class OrderItems extends Equatable {
  final Product? product;
  final int? price;
  final int? quantity;
  final String? id;

  const OrderItems({this.product, this.price, this.quantity, this.id});

  @override
  
  List<Object?> get props => [product, price, quantity, id];
}

class Product extends Equatable {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? discount;
  final int? sold;

  const Product(
      {this.id,
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
      this.sold});

  @override
  
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        imgCover,
        images,
        price,
        priceAfterDiscount,
        quantity,
        category,
        occasion,
        createdAt,
        updatedAt,
        discount,
        sold
      ];
}

class Store extends Equatable {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  const Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});
  double get latitude {
    if (latLong == null) return 0.0;
    final parts = latLong!.split(',');
    return double.tryParse(parts[0].trim()) ?? 0.0;
  }

  double get longitude {
    if (latLong == null) return 0.0;
    final parts = latLong!.split(',');
    return double.tryParse(parts[1].trim()) ?? 0.0;
  }
  @override
  
  List<Object?> get props => [name, image, address, phoneNumber, latLong];
}
class Driver {
  Driver({
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.createdAt,
    this.location,
  });

  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? createdAt;
  Location? location;

}