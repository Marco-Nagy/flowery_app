// ignore_for_file: depend_on_referenced_packages

import 'package:flowery_e_commerce/features/track_order/data/models/track_order_model.dart';
import 'package:flowery_e_commerce/features/track_order/domain/entities/track_order_entity.dart';
import 'package:geocoding/geocoding.dart';

class TrackOrderMapper {
  static TrackOrderEntity toTrackOrderEntity(TrackOrderModel model) {
    return TrackOrderEntity(
      driver: Driver(
        id: model.driver.id,
        country: model.driver.country,
        firstName: model.driver.firstName,
        lastName: model.driver.lastName,
        vehicleType: model.driver.vehicleType,
        vehicleNumber: model.driver.vehicleNumber,
        vehicleLicense: model.driver.vehicleLicense,
        nid: model.driver.nID,
        nIDImg: model.driver.nIDImg,
        email: model.driver.email,
        gender: model.driver.gender,
        phone: model.driver.phone,
        photo: model.driver.photo,
        createdAt: model.driver.createdAt,
        location: Location(
            latitude: model.orders.user.location.latitude,
            longitude: model.orders.user.location.longitude,
            timestamp: DateTime.now()),
      ),
      orders: OrderData(
        id: model.orders.id,
        user: UserData(
          id: model.orders.user.id,
          firstName: model.orders.user.firstName,
          lastName: model.orders.user.lastName,
          email: model.orders.user.email,
          gender: model.orders.user.gender,
          phone: model.orders.user.phone,
          photo: model.orders.user.photo,
          location: Location(
              latitude: model.orders.user.location.latitude,
              longitude: model.orders.user.location.longitude,
              timestamp: DateTime.now()),
        ),
        orderItems: model.orders.orderItems.map((item) {
          return OrderItems(
            product: Product(
              id: item.product.id,
              title: item.product.title,
              slug: item.product.slug,
              description: item.product.description,
              imgCover: item.product.imgCover,
              images: item.product.images,
              price: item.product.price,
              priceAfterDiscount: item.product.priceAfterDiscount,
              quantity: item.product.quantity,
              category: item.product.category,
              occasion: item.product.occasion,
              createdAt: item.product.createdAt,
              updatedAt: item.product.updatedAt,
              discount: item.product.discount,
              sold: item.product.sold,
            ),
            price: item.price,
            quantity: item.quantity,
            id: item.id,
          );
        }).toList(),
        totalPrice: model.orders.totalPrice,
        paymentType: model.orders.paymentType,
        isPaid: model.orders.isPaid,
        isDelivered: model.orders.isDelivered,
        state: model.orders.state,
        createdAt: model.orders.createdAt,
        updatedAt: model.orders.updatedAt,
        orderNumber: model.orders.orderNumber,
        store: Store(
          name: model.orders.store.name,
          image: model.orders.store.image,
          address: model.orders.store.address,
          phoneNumber: model.orders.store.phoneNumber,
          latLong: model.orders.store.latLong,
        ),
      ),
    );
  }

  static Driver toDriverData(Driver driver) {
    return Driver(
      id: driver.id,
      country: driver.country,
      firstName: driver.firstName,
      lastName: driver.lastName,
      vehicleType: driver.vehicleType,
      vehicleNumber: driver.vehicleNumber,
      vehicleLicense: driver.vehicleLicense,
      nid: driver.nid,
      nIDImg: driver.nIDImg,
      email: driver.email,
      gender: driver.gender,
      phone: driver.phone,
      photo: driver.photo,
      createdAt: driver.createdAt,
    );
  }



}
