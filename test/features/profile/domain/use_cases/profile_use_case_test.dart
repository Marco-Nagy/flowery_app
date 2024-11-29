import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:flowery_e_commerce/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ProfileUseCase _useCase;
  late MockProfileRepo _repository;

  setUp(() {
    _repository = MockProfileRepo();
    _useCase = ProfileUseCase(_repository);
    provideDummy<DataResult<GetLoggedUserDataResponseEntity>>(
      Success(
        GetLoggedUserDataResponseEntity(
            user: GetLoggedUserDataResponseUserEntity(
          id: "1",
          firstName: "Yasmin",
          lastName: "gad",
          email: "yasmin@gmail",
          gender: "female",
          phone: "+20123456789",
          photo: "test",
          role: "user",
        )),
      ),
    );
  });

  group("ProfileUseCase Tests", () {
    test('should return Success when repo call is successful', () async {
      final responseEntity = GetLoggedUserDataResponseEntity(
          user: GetLoggedUserDataResponseUserEntity(
        id: "1",
        firstName: "Yasmin",
        lastName: "gad",
        email: "yasmin@gmail",
        gender: "female",
        phone: "+20123456789",
        photo: "test",
        role: "user",
      ));
      final successResult =
          Success<GetLoggedUserDataResponseEntity>(responseEntity);

      when(_repository.getProfileData(any))
          .thenAnswer((_) async => successResult);

      final result = await _useCase.getProfileData('token');

      expect(result, isA<Success<GetLoggedUserDataResponseEntity>>());
      final success = result as Success<GetLoggedUserDataResponseEntity>;
      expect(success.data.user?.id, '1');
      expect(success.data.user?.firstName, 'Yasmin');
      expect(success.data.user?.lastName, 'gad');
      expect(success.data.user?.email, 'yasmin@gmail');
      expect(success.data.user?.gender, 'female');
      expect(success.data.user?.phone, '+20123456789');
      expect(success.data.user?.photo, 'test');
      expect(success.data.user?.role, 'user');
      verify(_repository.getProfileData('token')).called(1);
    });

    test('should return fail when repo call is failed', () async {
      final exception = Exception('error');
      final failResult = Fail<GetLoggedUserDataResponseEntity>(exception);
      when(_repository.getProfileData(any)).thenAnswer((_) async => failResult);
      final result = await _useCase.getProfileData('token');

      expect(result, isA<Fail<GetLoggedUserDataResponseEntity>>());
      final fail = result as Fail<GetLoggedUserDataResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_repository.getProfileData('token')).called(1);
    });
  });
}
