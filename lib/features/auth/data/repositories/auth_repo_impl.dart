import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/offline_data_source.dart';
import 'package:flowery_e_commerce/features/auth/domain/contracts/auth_repo.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/contracts/auth_online_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource _onlineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this._onlineDataSource);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    var result = await _onlineDataSource.login(request);
    return result;
  }
}
