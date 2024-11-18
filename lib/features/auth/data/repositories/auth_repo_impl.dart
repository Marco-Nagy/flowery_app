import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
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
