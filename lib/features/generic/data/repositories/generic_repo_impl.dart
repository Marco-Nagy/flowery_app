import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/contracts/generic_repo.dart';
import '../data_sources/contracts/generic_online_data_source.dart';

@Injectable(as: GenericRepo)
class GenericRepositoryImpl implements GenericRepo {
  final GenericOnlineDataSource _onlineDataSource;

  @factoryMethod
  GenericRepositoryImpl(this._onlineDataSource);

  @override
  Future<DataResult<GenericResponseEntity>> getAll(String resourceName) async {
    var result = await _onlineDataSource.getAll(resourceName);
    return result;
  }
}
