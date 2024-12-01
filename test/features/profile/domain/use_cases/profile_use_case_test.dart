import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
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
    provideDummy<DataResult<EditProfileResponseEntity>>(Success(
      EditProfileResponseEntity(
          user: EditProfileResponseUserEntity(
              id: '1',
              firstName: 'Yasmin',
              lastName: 'gad',
              email: 'yasmin@gmail',
              gender: 'female',
              phone: '+20123456789',
              photo: 'test',
              role: 'user')),
    ));
  });

  group("ProfileUseCase Tests", () {
    test('should return Success when get profile data is successful', () async {
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

    test('should return fail when get profile data is failed', () async {
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

    test("should return Success when edit profile is successful", () async {
      var profileData = {
        "first_name": "Yasmin",
        "last_name": "gad",
        "email": "yasmin@gmail",
        "gender": "female",
        "phone": "+20123456789",
        "photo": "test",
      };

      var responseEntity = EditProfileResponseEntity(
          user: EditProfileResponseUserEntity(
              id: '1',
              firstName: 'Yasmin',
              lastName: 'gad',
              email: 'yasmin@gmail',
              gender: 'female',
              phone: '+20123456789',
              photo: 'test',
              role: 'user'));

      var successResult = Success<EditProfileResponseEntity>(responseEntity);
      when(_repository.editProfile(any, any))
          .thenAnswer((_) async => successResult);
      var result = await _useCase.editProfile('token', profileData);
      expect(result, isA<Success<EditProfileResponseEntity>>());
      final success = result as Success<EditProfileResponseEntity>;

      expect(success.data.user?.id, '1');
      expect(success.data.user?.firstName, 'Yasmin');
      expect(success.data.user?.lastName, 'gad');
      expect(success.data.user?.email, 'yasmin@gmail');
      expect(success.data.user?.gender, 'female');
      expect(success.data.user?.phone, '+20123456789');
      expect(success.data.user?.photo, 'test');
      expect(success.data.user?.role, 'user');

      verify(_repository.editProfile('token', profileData)).called(1);
    });

    test("should return fail when edit profile is failed", () async {
      var profileData = {
        "first_name": "Yasmin",
        "last_name": "gad",
        "email": "yasmin@gmail",
        "gender": "female",
        "phone": "+20123456789",
        "photo": "test",
      };

      var exception = Exception('error');
      var failResult = Fail<EditProfileResponseEntity>(exception);
      when(_repository.editProfile(any, any))
          .thenAnswer((_) async => failResult);
      var result = await _useCase.editProfile('token', profileData);
      expect(result, isA<Fail<EditProfileResponseEntity>>());
      final fail = result as Fail<EditProfileResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_repository.editProfile('token', profileData)).called(1);
    });
  });
}
