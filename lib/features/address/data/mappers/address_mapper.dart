import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

class AddressMapper {
  static List<GetSavedAddressesEntity> toSavedAddressesMapper(
      SavedAddressResponseEntityDtoEntity savedAddresses) {
    if (savedAddresses.addresses == null) return [];
    return savedAddresses.addresses!
        .map(
          (address) => GetSavedAddressesEntity(
            street: address!.street,
            city: address.city,
            id: address.id,
          ),
        )
        .toList();
  }
}
