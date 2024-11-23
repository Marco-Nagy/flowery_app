import '../../domain/entities/response/get_all_products_response_entity.dart';
import '../models/response/get_all_products_rsponse_dto.dart';

class ProductsMapper {
  static GetAllProductsRsponseEntity toEntity(
      GetAllProductsRsponseDto response) {
    return GetAllProductsRsponseEntity(
      products: response.products?.map((e) => toProductsEntity(e!)).toList(),
    );
  }

  static GetAllProductsRsponseDtoProductsEntity toProductsEntity(
      GetAllProductsRsponseDtoProducts products) {
    return GetAllProductsRsponseDtoProductsEntity(
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
