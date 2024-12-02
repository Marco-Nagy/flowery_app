import '../../domain/entity/generic_response_entity.dart';
import '../models/generic_response_dto.dart';

class Mapper {
  static GenericResponseEntity toEntity(GenericResponseDto response, String resourceName) {
    List<Items> items = [];

    if (resourceName == 'occasions') {
      items = _mapItemModelToItemsList(response.occasions ?? []);
    } else if (resourceName == 'categories') {
      items = _mapItemModelToItemsList(response.categories ?? []);
    }

    return GenericResponseEntity(
      message: response.message,
      items: items,
    );
  }

  static List<Items> _mapItemModelToItemsList(List<ItemModel> itemModels) {
    return itemModels.map((itemModel) => _mapItemModelToItems(itemModel)).toList();
  }

  static Items _mapItemModelToItems(ItemModel itemModel) {
    return Items(
      id: itemModel.id,
      name: itemModel.name,
      slug: itemModel.slug,
      image: itemModel.image,
      createdAt: itemModel.createdAt,
      updatedAt: itemModel.updatedAt,
    );
  }
}
