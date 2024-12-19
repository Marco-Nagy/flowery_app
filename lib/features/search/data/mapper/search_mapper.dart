import 'package:flowery_e_commerce/features/search/data/models/response/search_response_dto.dart';
import 'package:flowery_e_commerce/features/search/domain/entities/response/search_response_entity.dart';

class SearchMapper {
  static SearchResponseEntity toSearchResponseEntity(SearchResponseDto dto) {
    return SearchResponseEntity(
      products:
          dto.products?.map((e) => toSearchResponseEntityProducts(e!)).toList(),
    );
  }

  static SearchResponseEntityProducts toSearchResponseEntityProducts(
      SearchResponseDtoProducts dto) {
    return SearchResponseEntityProducts(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      price: dto.price,
      category: dto.category,
      quantity: dto.quantity,
      discount: dto.discount,
      images: dto.images,
      imgCover: dto.imgCover,
      sold: dto.sold,
      occasion: dto.occasion,
      priceAfterDiscount: dto.priceAfterDiscount,
      slug: dto.slug,
    );
  }
}
