class GenericProductResponseEntity {
  final List<ProductEntity> products;

  GenericProductResponseEntity({required this.products});
}

class ProductEntity {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String?>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;

  ProductEntity({
    this.id,
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
  });
}
// class GenericProductResponseEntity {
//   final List<ProductEntity?>? products;
//
//   GenericProductResponseEntity({this.products});
//
//   // Filter method
//   List<ProductEntity?>? filterProducts(String field, String? value) {
//     if (value == null || products == null) return products;
//
//     switch (field) {
//       case 'category':
//         return products?.where((product) => product?.category == value).toList();
//       case 'occasion':
//         return products?.where((product) => product?.occasion == value).toList();
//       default:
//         return products;
//     }
//   }
// }
//
// class ProductEntity {
//   final String? id;
//   final String? title;
//   final String? slug;
//   final String? description;
//   final String? imgCover;
//   final List<String?>? images;
//   final int? price;
//   final int? priceAfterDiscount;
//   final int? quantity;
//   final String? category;
//   final String? occasion;
//
//   ProductEntity({
//     this.id,
//     this.title,
//     this.slug,
//     this.description,
//     this.imgCover,
//     this.images,
//     this.price,
//     this.priceAfterDiscount,
//     this.quantity,
//     this.category,
//     this.occasion,
//   });
// }
