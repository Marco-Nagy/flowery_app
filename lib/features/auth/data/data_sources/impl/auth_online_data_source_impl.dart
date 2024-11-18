import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../mappers/auth_mapper.dart';
import '../contracts/auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await executeApi(() async {
      var response = await _apiManager.login(AuthMapper.toDto(request));
      return AuthMapper.toEntity(response);
    });
  }
}
