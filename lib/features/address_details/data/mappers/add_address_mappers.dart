import 'package:flowery_e_commerce/features/address_details/data/models/request/add_address_request_dto.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';

import '../models/response/add_address_response_dto.dart';

class AddAddressMappers {
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
