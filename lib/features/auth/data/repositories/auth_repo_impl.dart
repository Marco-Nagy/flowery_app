import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/entities/request/signup_request_entity.dart';
import '../../domain/entities/response/signup_response_entity.dart';
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

  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request}) async {
    var result = await _onlineDataSource.signUp(request: request);
    return result;
  }
}
