import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/data/data_sources/contracts/profile_online_data_source.dart';
import 'package:flowery_e_commerce/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_respose_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileOnlineDataSource])
void main() {

  late ProfileRepoImpl profileRepo;
  late ProfileOnlineDataSource profileOnlineDataSource;

  setUp(() {
    profileOnlineDataSource = MockProfileOnlineDataSource();
    profileRepo = ProfileRepoImpl(profileOnlineDataSource);

    provideDummy<DataResult<GetLoggedUserDataResponseEntity>>(Success(
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
          ))
    ));

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
          role: 'user',
        )
      )
    ));

    provideDummy<DataResult<UploadPhotoResponseEntity>>(Success(
      const UploadPhotoResponseEntity(
        message: 'message'
      )
    ));

    provideDummy<DataResult<ChangePasswordResponseEntity>>(Success(
        const ChangePasswordResponseEntity(
            token: 'token'
        )
    ));
  });

  group('profile repo test', () {
     test('should return success when get profile data is successful', () async {

       var responseEntity = const GetLoggedUserDataResponseEntity(
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
       var successResult = Success<GetLoggedUserDataResponseEntity>(responseEntity);
       when(profileOnlineDataSource.getProfileData()).thenAnswer((_) async => successResult);
       var result = await profileRepo.getProfileData();
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
       verify(profileOnlineDataSource.getProfileData()).called(1);
     });

     test('should return fail when get profile data is failed', () async {

       var exception = Exception('error');
       var failResult = Fail<GetLoggedUserDataResponseEntity>(exception);
       when(profileOnlineDataSource.getProfileData()).thenAnswer((_) async => failResult);
       var result = await profileRepo.getProfileData();
       expect(result, isA<Fail<GetLoggedUserDataResponseEntity>>());
       final fail = result as Fail<GetLoggedUserDataResponseEntity>;
       expect(fail.exception, isA<Exception>());
       expect(fail.exception.toString(), 'Exception: error');
       verify(profileOnlineDataSource.getProfileData()).called(1);
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
       var responseEntity = const EditProfileResponseEntity(
           user: EditProfileResponseUserEntity(
             id: "1",
             firstName: "Yasmin",
             lastName: "gad",
             email: "yasmin@gmail",
             gender: "female",
             phone: "+20123456789",
             photo: "test",
             role: "user",
           ));
       var successResult = Success<EditProfileResponseEntity>(responseEntity);
       when(profileOnlineDataSource.editProfile(profileData)).thenAnswer((_) async => successResult);
       var result = await profileRepo.editProfile(profileData);
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
       verify(profileOnlineDataSource.editProfile(profileData)).called(1);
     });

     test('should return fail when edit profile is failed', () async {
       var profileData = {
         "first_name": "Yasmin",
         "last_name": "gad",
         "email": "yasmin@gmail",
         "gender": "female",
         "phone": "+20123456789",
         "photo": "test",
         "role": "user",
       };
       var exception = Exception('error');
       var failResult = Fail<EditProfileResponseEntity>(exception);
       when(profileOnlineDataSource.editProfile(profileData)).thenAnswer((_) async => failResult);
       var result = await profileRepo.editProfile(profileData);
       expect(result, isA<Fail<EditProfileResponseEntity>>());
       final fail = result as Fail<EditProfileResponseEntity>;
       expect(fail.exception, isA<Exception>());
       expect(fail.exception.toString(), 'Exception: error');
       verify(profileOnlineDataSource.editProfile(profileData)).called(1);
     });

     test('should return success when upload photo is successful', () async {
       var photo = File('path');

       var responseEntity = const UploadPhotoResponseEntity(
         message: 'message'
       );

       var successResult = Success<UploadPhotoResponseEntity>(responseEntity);
       when(profileOnlineDataSource.uploadPhoto(photo)).thenAnswer((_) async => successResult);
       var result = await profileRepo.uploadPhoto(photo);
       expect(result, isA<Success<UploadPhotoResponseEntity>>());
       final success = result as Success<UploadPhotoResponseEntity>;
       expect(success.data.message, 'message');
       verify(profileOnlineDataSource.uploadPhoto(photo)).called(1);
     });

     test('should return fail when upload photo is failed', () async {
       var photo = File('path');

       var exception = Exception('error');
       var failResult = Fail<UploadPhotoResponseEntity>(exception);
       when(profileOnlineDataSource.uploadPhoto(photo)).thenAnswer((_) async => failResult);
       var result = await profileRepo.uploadPhoto(photo);
       expect(result, isA<Fail<UploadPhotoResponseEntity>>());
       final fail = result as Fail<UploadPhotoResponseEntity>;
       expect(fail.exception, isA<Exception>());
       expect(fail.exception.toString(), 'Exception: error');
       verify(profileOnlineDataSource.uploadPhoto(photo)).called(1);
     });

     test('should return success when change password is successful', () async{
       var request = const ChangePasswordRequestEntity(
         password: '1234',
         newPassword: '12345',
       );

       var responseEntity = const ChangePasswordResponseEntity(
         token: 'token'
       );

       var successResult = Success<ChangePasswordResponseEntity>(responseEntity);
       when(profileOnlineDataSource.changePassword(request)).thenAnswer((_) async => successResult);
       var result = await profileRepo.changePassword(request);
       expect(result, isA<Success<ChangePasswordResponseEntity>>());
       final success = result as Success<ChangePasswordResponseEntity>;
       expect(success.data.token, 'token');
       verify(profileOnlineDataSource.changePassword(request)).called(1);
     });

     test('should return fail when change password is failed', () async{
       var request = const ChangePasswordRequestEntity(
         password: '1234',
         newPassword: '12345',
       );

       var exception = Exception('error');
       var failResult = Fail<ChangePasswordResponseEntity>(exception);
       when(profileOnlineDataSource.changePassword(request)).thenAnswer((_) async => failResult);
       var result = await profileRepo.changePassword(request);
       expect(result, isA<Fail<ChangePasswordResponseEntity>>());
       final fail = result as Fail<ChangePasswordResponseEntity>;
       expect(fail.exception, isA<Exception>());
       expect(fail.exception.toString(), 'Exception: error');
       verify(profileOnlineDataSource.changePassword(request)).called(1);
     });
  });
}