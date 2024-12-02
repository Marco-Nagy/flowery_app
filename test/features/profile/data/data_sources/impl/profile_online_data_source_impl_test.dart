import 'dart:io';

import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/data/data_sources/impl/profile_online_data_source_impl.dart';
import 'package:flowery_e_commerce/features/profile/data/models/request/change_password_request_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/change_password_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/edit_profile_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/get_logged_user_data_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/upload_photo_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_respose_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/data_sources/impl/auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {


  late ProfileOnlineDataSourceImpl _dataSource;
  late MockApiManager _mockApiManager;

  setUp(() {
    _mockApiManager = MockApiManager();
    _dataSource = ProfileOnlineDataSourceImpl(_mockApiManager);
  });

  group('profile data source impl test', () {
    test('should return success when get profile data is successful', () async {
      var responseDto = GetLoggedUserDataResponseDto(
        'success',
        GetLoggedUserDataResponseDtoUser(
          '1',
          'Yasmin',
          'gad',
          'yasmin@gmail',
          'female',
          '+20123456789',
          'test',
          'user',
          'test',
        ),
      );

      const expectedEntity = GetLoggedUserDataResponseEntity(
        user: GetLoggedUserDataResponseUserEntity(
          id: '1',
          firstName: 'Yasmin',
          lastName: 'gad',
          email: 'yasmin@gmail',
          gender: 'female',
          phone: '+20123456789',
          photo: 'test',
          role: 'user',
        ),
      );

      when(_mockApiManager.getLoggedUserData()).thenAnswer((_) async => responseDto);

      var result = await _dataSource.getProfileData();

      expect(result, isA<Success<GetLoggedUserDataResponseEntity>>());
      final successResult = result as Success<GetLoggedUserDataResponseEntity>;
      expect(successResult.data, expectedEntity);
    });

    test('should return fail when get profile data is failed', () async {
      var exception = Exception('error');
      when(_mockApiManager.getLoggedUserData()).thenThrow(exception);
      var result = await _dataSource.getProfileData();
      expect(result, isA<Fail<GetLoggedUserDataResponseEntity>>());
      final fail = result as Fail<GetLoggedUserDataResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_mockApiManager.getLoggedUserData()).called(1);
    });

    test('should return success when edit profile is successful', () async {
      var profileData = {
        "first_name": "Yasmin",
        "last_name": "gad",
        "email": "yasmin@gmail",
        "gender": "female",
        "phone": "+20123456789",
        "photo": "test",
        "role": "user",
      };

      var responseDto = EditProfileResponseDto(
        'success',
        EditProfileResponseDtoUser(
          '1',
          'Yasmin',
          'gad',
          'yasmin@gmail',
          'female',
          'test',
          '+20123456789',
          'test',
          'user',
          'test'
        ),
      );

      var expectedEntity = EditProfileResponseEntity(
        user: EditProfileResponseUserEntity(
          id: '1',
          firstName: 'Yasmin',
          lastName: 'gad',
          email: 'yasmin@gmail',
          gender: 'test',
          photo: 'test',
          phone: '+20123456789',
          role: 'user',
        ),
      );

      when(_mockApiManager.editProfile(profileData)).thenAnswer((_) async => responseDto);

      var result = await _dataSource.editProfile(profileData);

      expect(result, isA<Success<EditProfileResponseEntity>>());
      final successResult = result as Success<EditProfileResponseEntity>;
      expect(successResult.data, expectedEntity);
    });

    test('should return fail when edit profile is failed', () async {
      var exception = Exception('error');
      var profileData = {
        "first_name": "Yasmin",
        "last_name": "gad",
        "email": "yasmin@gmail",
        "gender": "female",
        "phone": "+20123456789",
        "photo": "test",
        "role": "user",
      };
      when(_mockApiManager.editProfile(profileData)).thenThrow(exception);
      var result = await _dataSource.editProfile(profileData);
      expect(result, isA<Fail<EditProfileResponseEntity>>());
      final fail = result as Fail<EditProfileResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_mockApiManager.editProfile(profileData)).called(1);
    });

    test('should return success when change password is successful', () async {
      const requestEntity = ChangePasswordRequestEntity(
        password: '123',
        newPassword: '12345',
      );
      var responseDto = ChangePasswordResponseDto('success', 'token');
      var expectedEntity = const ChangePasswordResponseEntity(token: 'token');

      when(_mockApiManager.changePassword(any)).thenAnswer((_) async => responseDto);
      var result = await _dataSource.changePassword(requestEntity);

      expect(result, isA<Success<ChangePasswordResponseEntity>>());
      final successResult = result as Success<ChangePasswordResponseEntity>;
      expect(successResult.data, expectedEntity);

      verify(_mockApiManager.changePassword(any)).called(1);
    });

    test('should return fail when change password is failed', () async {
      const requestEntity = ChangePasswordRequestEntity(
        password: '123',
        newPassword: '12345',
      );

      var exception = Exception('error');
      when(_mockApiManager.changePassword(any)).thenThrow(exception);
      var result = await _dataSource.changePassword(requestEntity);
      expect(result, isA<Fail<ChangePasswordResponseEntity>>());
      final fail = result as Fail<ChangePasswordResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_mockApiManager.changePassword(any)).called(1);
    });

    test('should return success when upload photo is successful', () async {
      var photo = File('test');

      var responseDto = UploadPhotoResponseDto('success');
      var expectedEntity = const UploadPhotoResponseEntity(message: 'success');

      when(_mockApiManager.uploadPhoto(any)).thenAnswer((_) async => responseDto);
      var result = await _dataSource.uploadPhoto(photo);

      expect(result, isA<Success<UploadPhotoResponseEntity>>());
      final successResult = result as Success<UploadPhotoResponseEntity>;
      expect(successResult.data, expectedEntity);

      verify(_mockApiManager.uploadPhoto(any)).called(1);
    });

    test('should return fail when upload photo is failed', () async {
      var photo = File('test');
      var exception = Exception('error');
      when(_mockApiManager.uploadPhoto(any)).thenThrow(exception);
      var result = await _dataSource.uploadPhoto(photo);
      expect(result, isA<Fail<UploadPhotoResponseEntity>>());
      final fail = result as Fail<UploadPhotoResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(_mockApiManager.uploadPhoto(any)).called(1);
    });
  });
}