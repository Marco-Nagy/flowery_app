import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:flowery_e_commerce/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ProfileUseCase useCase;
  late MockProfileRepo repository;

  setUp(() {
    repository = MockProfileRepo();
    useCase = ProfileUseCase(repository);
    provideDummy<DataResult<GetLoggedUserDataResponseEntity>>(
      Success(
        const GetLoggedUserDataResponseEntity(
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
      const EditProfileResponseEntity(
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

    provideDummy<DataResult<ChangePasswordResponseEntity>>(
      Success(const ChangePasswordResponseEntity(
        token: 'token',
      )),
    );

    provideDummy<DataResult<UploadPhotoResponseEntity>>(
      Success(
        const UploadPhotoResponseEntity(
          message: 'message',
        ),
      )
    );

  });

  group("ProfileUseCase Tests", () {
    test('should return Success when get profile data is successful', () async {
      const responseEntity = GetLoggedUserDataResponseEntity(
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

      when(repository.getProfileData())
          .thenAnswer((_) async => successResult);

      final result = await useCase.getProfileData();

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
      verify(repository.getProfileData()).called(1);
    });

    test('should return fail when get profile data is failed', () async {
      final exception = Exception('error');
      final failResult = Fail<GetLoggedUserDataResponseEntity>(exception);
      when(repository.getProfileData()).thenAnswer((_) async => failResult);
      final result = await useCase.getProfileData();

      expect(result, isA<Fail<GetLoggedUserDataResponseEntity>>());
      final fail = result as Fail<GetLoggedUserDataResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(repository.getProfileData()).called(1);
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

      var responseEntity = const EditProfileResponseEntity(
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
      when(repository.editProfile(any))
          .thenAnswer((_) async => successResult);
      var result = await useCase.editProfile(profileData);
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

      verify(repository.editProfile(profileData)).called(1);
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
      when(repository.editProfile(any))
          .thenAnswer((_) async => failResult);
      var result = await useCase.editProfile(profileData);
      expect(result, isA<Fail<EditProfileResponseEntity>>());
      final fail = result as Fail<EditProfileResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(repository.editProfile(profileData)).called(1);
    });

    test("should return Success when change password is successful", () async {
      var request = const ChangePasswordRequestEntity(
        password: '1234',
        newPassword: '12345',
      );

      var responseEntity = const ChangePasswordResponseEntity(
        token: 'token',
      );

      var successResult = Success<ChangePasswordResponseEntity>(responseEntity);
      when(repository.changePassword(any)).thenAnswer((_) async=> successResult);
      var result = await useCase.changePassword(request);

      expect(result, isA<Success<ChangePasswordResponseEntity>>());

      final success = result as Success<ChangePasswordResponseEntity>;
      expect(success.data.token, 'token');
      verify(repository.changePassword(request)).called(1);
    });

    test('should return fail when change password is failed', () async{

      var request = const ChangePasswordRequestEntity(
        password: '1234',
        newPassword: '12345',
      );

      var exception = Exception('error');
      var failResult = Fail<ChangePasswordResponseEntity>(exception);
      when(repository.changePassword(any)).thenAnswer((_) async=> failResult);
      var result = await useCase.changePassword(request);

      expect(result, isA<Fail<ChangePasswordResponseEntity>>());
      final fail = result as Fail<ChangePasswordResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(repository.changePassword(request)).called(1);
    });

    test('should return success when upload photo is successful', () async{
      var photo = File('test');

      var responseEntity = const UploadPhotoResponseEntity(
        message: 'message'
      );

      var successResult = Success<UploadPhotoResponseEntity>(responseEntity);
      when(repository.uploadPhoto(any)).thenAnswer((_) async=> successResult);
      var result = await useCase.uploadPhoto(photo);

      expect(result, isA<Success<UploadPhotoResponseEntity>>());
      final success = result as Success<UploadPhotoResponseEntity>;
      expect(success.data.message, 'message');
      verify(repository.uploadPhoto(photo)).called(1);
    });

    test('should return fail when upload photo is failed', () async{

      var photo = File('test');

      var exception = Exception('error');
      var failResult = Fail<UploadPhotoResponseEntity>(exception);
      when(repository.uploadPhoto(any)).thenAnswer((_) async=> failResult);
      var result = await useCase.uploadPhoto(photo);

      expect(result, isA<Fail<UploadPhotoResponseEntity>>());
      final fail = result as Fail<UploadPhotoResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(repository.uploadPhoto(photo)).called(1);
    });
  });
}
