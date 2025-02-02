class TrackOrderModel {
  final OrderDataModel orders;
  final DriverDto driver;

  TrackOrderModel({OrderDataModel? orders, DriverDto? driver})
      : orders = orders ?? OrderDataModel(),
        driver = driver ?? DriverDto();

  factory TrackOrderModel.fromJson(Map<String, dynamic> json) {
    return TrackOrderModel(
      driver: json['driver'] != null
          ? DriverDto.fromJson(json['driver'])
          : DriverDto(),
      orders: json['orders'] != null
          ? OrderDataModel.fromJson(json['orders'])
          : OrderDataModel(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.toJson(),
      'driver': driver.toJson(),
    };
  }
}

class OrderDataModel {
  final String id;
  final UserDataModel user;
  final List<OrderItemsModel> orderItems;
  final int totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final String createdAt;
  final String updatedAt;
  final String orderNumber;
  final StoreModel store;

  OrderDataModel({
    String? id,
    UserDataModel? user,
    List<OrderItemsModel>? orderItems,
    int? totalPrice,
    String? paymentType,
    bool? isPaid,
    bool? isDelivered,
    String? state,
    String? createdAt,
    String? updatedAt,
    String? orderNumber,
    StoreModel? store,
  })  : id = id ?? '',
        user = user ?? UserDataModel(),
        orderItems = orderItems ?? [],
        totalPrice = totalPrice ?? 0,
        paymentType = paymentType ?? '',
        isPaid = isPaid ?? false,
        isDelivered = isDelivered ?? false,
        state = state ?? '',
        createdAt = createdAt ?? '',
        updatedAt = updatedAt ?? '',
        orderNumber = orderNumber ?? '',
        store = store ?? StoreModel();

  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      id: json['id'],
      user: json['user'] != null
          ? UserDataModel.fromJson(json['user'])
          : UserDataModel(),
      orderItems: json['orderItems'] != null
          ? (json['orderItems'] as List)
              .map((e) =>
                  e != null ? OrderItemsModel.fromJson(e) : OrderItemsModel())
              .toList()
          : [],
      totalPrice: json['totalPrice'],
      paymentType: json['paymentType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      state: json['state'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      orderNumber: json['orderNumber'],
      store: json['store'] != null
          ? StoreModel.fromJson(json['store'])
          : StoreModel(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'paymentType': paymentType,
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'state': state,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'orderNumber': orderNumber,
      'store': store.toJson(),
    };
  }
}

class UserDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final LocationModel location;

  UserDataModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? phone,
    String? photo,
    LocationModel? location,
  })  : id = id ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        email = email ?? '',
        gender = gender ?? '',
        phone = phone ?? '',
        photo = photo ?? '',
        location = location ?? LocationModel();

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      photo: json['photo'],
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : LocationModel(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'phone': phone,
      'photo': photo,
      'location': location.toJson(),
    };
  }
}

class OrderItemsModel {
  final ProductModel product;
  final int price;
  final int quantity;
  final String id;

  OrderItemsModel(
      {ProductModel? product, int? price, int? quantity, String? id})
      : product = product ?? ProductModel(),
        price = price ?? 0,
        quantity = quantity ?? 0,
        id = id ?? '';

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : ProductModel(),
      price: json['price'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'price': price,
      'quantity': quantity,
      'id': id,
    };
  }
}

class ProductModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final String createdAt;
  final String updatedAt;
  final int discount;
  final int sold;

  ProductModel({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? imgCover,
    List<String>? images,
    int? price,
    int? priceAfterDiscount,
    int? quantity,
    String? category,
    String? occasion,
    String? createdAt,
    String? updatedAt,
    int? discount,
    int? sold,
  })  : id = id ?? '',
        title = title ?? '',
        slug = slug ?? '',
        description = description ?? '',
        imgCover = imgCover ?? '',
        images = images ?? [],
        price = price ?? 0,
        priceAfterDiscount = priceAfterDiscount ?? 0,
        quantity = quantity ?? 0,
        category = category ?? '',
        occasion = occasion ?? '',
        createdAt = createdAt ?? '',
        updatedAt = updatedAt ?? '',
        discount = discount ?? 0,
        sold = sold ?? 0;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imgCover: json['imgCover'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      quantity: json['quantity'],
      category: json['category'],
      occasion: json['occasion'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      discount: json['discount'],
      sold: json['sold'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'imgCover': imgCover,
      'images': images,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'quantity': quantity,
      'category': category,
      'occasion': occasion,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'discount': discount,
      'sold': sold,
    };
  }
}

class StoreModel {
  final String name;
  final String image;
  final String address;
  final String phoneNumber;
  final String latLong;

  StoreModel(
      {String? name,
      String? image,
      String? address,
      String? phoneNumber,
      String? latLong})
      : name = name ?? '',
        image = image ?? '',
        address = address ?? '',
        phoneNumber = phoneNumber ?? '',
        latLong = latLong ?? '';

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json['name'],
      image: json['image'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      latLong: json['latLong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'address': address,
      'phoneNumber': phoneNumber,
      'latLong': latLong,
    };
  }
}

class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({double? latitude, double? longitude})
      : latitude = latitude ?? 0.0,
        longitude = longitude ?? 0.0;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'] != null ? json['latitude'].toDouble() : 0.0,
      longitude: json['longitude'] != null ? json['longitude'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class DriverDto {
  final String id;
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String nID;
  final String nIDImg;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String createdAt;
  final LocationModel location;

  DriverDto({
    String? id,
    String? country,
    String? firstName,
    String? lastName,
    String? vehicleType,
    String? vehicleNumber,
    String? vehicleLicense,
    String? nID,
    String? nIDImg,
    String? email,
    String? gender,
    String? phone,
    String? photo,
    String? createdAt,
    LocationModel? location,
  })  : id = id ?? '',
        country = country ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        vehicleType = vehicleType ?? '',
        vehicleNumber = vehicleNumber ?? '',
        vehicleLicense = vehicleLicense ?? '',
        nID = nID ?? '',
        nIDImg = nIDImg ?? '',
        email = email ?? '',
        gender = gender ?? '',
        phone = phone ?? '',
        photo = photo ?? '',
        createdAt = createdAt ?? '',
        location = location ?? LocationModel();

  factory DriverDto.fromJson(Map<String, dynamic> json) {
    return DriverDto(
        id: json['id'],
        country: json['country'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        vehicleType: json['vehicleType'],
        vehicleNumber: json['vehicleNumber'],
        vehicleLicense: json['vehicleLicense'],
        nID: json['nID'],
        nIDImg: json['nIDImg'],
        email: json['email'],
        gender: json['gender'],
        phone: json['phone'],
        photo: json['photo'],
        createdAt: json['createdAt'],
        location: json['location'] != null
            ? LocationModel.fromJson(json['location'])
            : LocationModel());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'vehicleLicense': vehicleLicense,
      'nID': nID,
      'nIDImg': nIDImg,
      'email': email,
      'gender': gender,
      'phone': phone,
      'photo': photo,
      'createdAt': createdAt,
      'location': location.toJson(),
    };
  }
}
