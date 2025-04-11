
 import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

abstract class AddressRepo{
  Future<DataResult<List<AddressesEntity>>> getSavedAddresses();
 }