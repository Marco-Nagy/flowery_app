import 'package:injectable/injectable.dart';
import '../../../../../../../core/Services/shared_preference/shared_preference_helper.dart';
import '../../../../../../../core/Services/shared_preference/shared_pref_keys.dart';
import '../../../../../../core/Services/shared_preference/shared_preference_helper.dart';
import '../contracts/offline_data_source.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImplementation implements OfflineDataSource {

  @factoryMethod
  OfflineDataSourceImplementation();

  @override
  Future<void> cacheToken(String token) async {
    SharedPrefHelper()
        .setString(key: SharedPrefKeys.tokenKey, stringValue: token);
  }

  @override
  Future<String?> getToken() async {
    return SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey) ?? "";
  }
}
