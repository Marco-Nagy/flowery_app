import '../../domain/entities/response/generic_product_response_entity.dart';
import '../models/response/generic_products_response_dto.dart';

class GenericProductsMapper {
  static GenericProductResponseEntity toEntity(
      GenericProductsResponseDto response) {
    return GenericProductResponseEntity(
      products: response.products!.map((e) => toProductsEntity(e!)).toList(),
    );
  }

  static ProductEntity toProductsEntity(
      ProductDto products) {
    return ProductEntity(
      id: products.id,
      title: products.title,
      slug: products.slug,
      description: products.description,
      imgCover: products.imgCover,
      images: products.images,
      price: products.price,
      priceAfterDiscount: products.priceAfterDiscount,
      quantity: products.quantity,
      category: products.category,
      occasion: products.occasion,
    );
  }
}
