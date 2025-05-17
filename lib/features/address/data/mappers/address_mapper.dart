import 'package:flowery_store/features/address/data/models/request/add_address_request_dto.dart';
import 'package:flowery_store/features/address/data/models/response/add_address_response_dto.dart';
import 'package:flowery_store/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';

class AddressMapper {
  static List<AddressesEntity> toSavedAddressesMapper(
      SavedAddressResponseEntityDtoEntity savedAddresses) {
    if (savedAddresses.addresses == null) return [];

    return savedAddresses.addresses!
        .map(
          (address) => AddressesEntity(
            username: address!.username ?? "",
            phone: address.phone ?? "",
            long: address.long ?? "",
            lat: address.lat ?? "",
            street: address.street ?? "",
            city: address.city ?? "",
            id: address.id ?? "",
          ),
        )
        .toList();
  }
  static AddAddressRequestDto toAddAddressRequestDto(
      AddAddressRequestEntity entity) {
    return AddAddressRequestDto(entity.street, entity.phone, entity.city,
        entity.lat, entity.long, entity.username);
  }

  static AddAddressResponseEntity toAddAddressResponseEntity(
      AddAddressResponseDto dto) {
    return AddAddressResponseEntity(
      address: dto.address
          ?.map((e) => toAddAddressResponseEntityAddress(e!))
          .toList(),
    );
  }

  static AddAddressResponseEntityAddress toAddAddressResponseEntityAddress(
      AddAddressResponseDtoAddress dto) {
    return AddAddressResponseEntityAddress(
        id: dto.id, phone: dto.phone, street: dto.street, city: dto.city);
  }
}
