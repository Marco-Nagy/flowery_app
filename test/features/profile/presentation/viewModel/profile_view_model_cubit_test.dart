import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/offline_data_source.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_view_model_cubit_test.mocks.dart';

@GenerateMocks([ProfileUseCase, OfflineDataSource])
void main() {
  late MockProfileUseCase profileUseCase;
  late MockOfflineDataSource offlineDataSource;
  late ProfileViewModelCubit profileViewModelCubit;

  setUp(() {
    profileUseCase = MockProfileUseCase();
    offlineDataSource = MockOfflineDataSource();
    profileViewModelCubit =
        ProfileViewModelCubit(profileUseCase, offlineDataSource);
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
        ),
      ),
    ));

    provideDummy<DataResult<EditProfileResponseEntity>>(Success(
      const EditProfileResponseEntity(
        user: EditProfileResponseUserEntity(
          id: "1",
          firstName: "Yasmin",
          lastName: "gad",
          email: "yasmin@gmail",
          gender: "female",
          phone: "+20123456789",
          photo: "test",
          role: "user",
        ),
      ),
    ));

    provideDummy<DataResult<UploadPhotoResponseEntity>>(
        Success(const UploadPhotoResponseEntity(
      message: 'message',
    )));

    provideDummy<DataResult<ChangePasswordResponseEntity>>(
        Success(const ChangePasswordResponseEntity(
      token: 'token',
    )));
  });

  blocTest<ProfileViewModelCubit, ProfileViewModelState>(
    'should emit [GetLoggedUserDataLoading, GetLoggedUserDataSuccess] when GetLoggedUserData is called',
    build: () {
      var result = Success(
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
          ),
        ),
      );

      when(profileUseCase.getProfileData()).thenAnswer((_) async => result);
      return profileViewModelCubit;
    },
    act: (viewModel) => viewModel.doAction(GetLoggedUserData()),
    expect: () => <ProfileViewModelState>[
      GetLoggedUserDataLoading(),
      GetLoggedUserDataSuccess(
        data: const GetLoggedUserDataResponseEntity(
          user: GetLoggedUserDataResponseUserEntity(
            id: "1",
            firstName: "Yasmin",
            lastName: "gad",
            email: "yasmin@gmail",
            gender: "female",
            phone: "+20123456789",
            photo: "test",
            role: "user",
          ),
        ),
      ),
    ],
    verify: (_) {
      verify(profileUseCase.getProfileData()).called(1);
    },
  );

  blocTest<ProfileViewModelCubit, ProfileViewModelState>(
    'when GetLoggedUserData is called should emit [GetLoggedUserDataLoading, GetLoggedUserDataError',
    build: () {
      when(profileUseCase.getProfileData())
          .thenAnswer((_) async => Fail(Exception('error')));
      return profileViewModelCubit;
    },
    act: (viewModel) => viewModel.doAction(GetLoggedUserData()),
    expect: () => <ProfileViewModelState>[
      GetLoggedUserDataLoading(),
      GetLoggedUserDataError(
          error: const ErrorModel(
              error: 'An unknown error occurred. Please try again.')),
    ],
    verify: (_) => verify(profileUseCase.getProfileData()).called(1),
  );

  blocTest<ProfileViewModelCubit, ProfileViewModelState>(
      'when edit profile is called should emit [EditProfileLoading, EditProfileSuccess',
      build: () {
        var profileData = <String, dynamic>{
          "first_name": "Yasmin",
          "last_name": "gad",
          "email": "yasmin@gmail",
          "gender": "female",
          "phone": "+20123456789",
          "photo": "test",
        };
        var result = Success(const EditProfileResponseEntity(
            user: EditProfileResponseUserEntity(
          id: '1',
          firstName: 'Yasmin',
          lastName: 'gad',
          email: 'yasmin@gmail',
          gender: 'female',
          phone: '+20123456789',
          photo: 'test',
          role: 'user',
        )));

        when(profileUseCase.editProfile(profileData))
            .thenAnswer((_) async => result);
        return profileViewModelCubit;
      },
      act: (viewModel) {
        var profileData = <String, dynamic>{
          "first_name": "Yasmin",
          "last_name": "gad",
          "email": "yasmin@gmail",
          "gender": "female",
          "phone": "+20123456789",
          "photo": "test",
        };
        return viewModel.doAction(EditProfile(profileData));
      },
      expect: () => <ProfileViewModelState>[
            EditProfileLoading(),
            EditProfileSuccess(
                data: const EditProfileResponseEntity(
                    user: EditProfileResponseUserEntity(
              id: '1',
              firstName: 'Yasmin',
              lastName: 'gad',
              email: 'yasmin@gmail',
              gender: 'female',
              phone: '+20123456789',
              photo: 'test',
              role: 'user',
            ))),
          ],
      verify: (_) => verify(profileUseCase.editProfile(any)).called(1));

  blocTest(
      'when edit profile is called should emit [EditProfileLoading, EditProfileError',
      build: () {
        var profileData = <String, dynamic>{
          "first_name": "Yasmin",
          "last_name": "gad",
          "email": "yasmin@gmail",
          "gender": "female",
          "phone": "+20123456789",
          "photo": "test",
        };
        when(profileUseCase.editProfile(profileData))
            .thenAnswer((_) async => Fail(Exception('error')));
        return profileViewModelCubit;
      },
      act: (viewModel) {
        var profileData = <String, dynamic>{
          "first_name": "Yasmin",
          "last_name": "gad",
          "email": "yasmin@gmail",
          "gender": "female",
          "phone": "+20123456789",
          "photo": "test",
        };
        return viewModel.doAction(EditProfile(profileData));
      },
      expect: () => <ProfileViewModelState>[
            EditProfileLoading(),
            EditProfileError(
                error: const ErrorModel(
                    error: 'An unknown error occurred. Please try again.')),
          ],
      verify: (_) => verify(profileUseCase.editProfile(any)).called(1));

  blocTest(
      'when upload photo is called it should emit [UploadPhotoLoading, UploadPhotoSuccess',
      build: () {
        var result = Success(const UploadPhotoResponseEntity(
          message: 'message',
        ));
        when(profileUseCase.uploadPhoto(any)).thenAnswer((_) async => result);
        return profileViewModelCubit;
      },
      act: (viewModel) => viewModel.doAction(UploadPhoto(File('photo'))),
      expect: () => <ProfileViewModelState>[
            UploadPhotoLoading(),
            UploadPhotoSuccess(
                data: const UploadPhotoResponseEntity(
              message: 'message',
            )),
          ],
      verify: (_) => verify(profileUseCase.uploadPhoto(any)).called(1));

  blocTest<ProfileViewModelCubit, ProfileViewModelState>(
      'when upload photo is called it should emit [UploadPhotoLoading, UploadPhotoError',
      build: () {
        var result = Fail<UploadPhotoResponseEntity>(Exception('error'));
        when(profileUseCase.uploadPhoto(any)).thenAnswer((_) async => result);
        return profileViewModelCubit;
      },
      act: (viewModel) => viewModel.doAction(UploadPhoto(File('photo'))),
      expect: () => <ProfileViewModelState>[
            UploadPhotoLoading(),
            UploadPhotoError(
                error: const ErrorModel(
                    error: 'An unknown error occurred. Please try again.')),
          ],
      verify: (_) => verify(profileUseCase.uploadPhoto(any)).called(1));
  blocTest(
      'when ChangePassword is called it should emit [ChangePasswordLoading, ChangePasswordSuccess',
      build: () {
        var result = Success(const ChangePasswordResponseEntity(
          token: 'token',
        ));
        when(profileUseCase.changePassword(any))
            .thenAnswer((_) async => result);
        return profileViewModelCubit;
      },
      act: (viewModel) {
        return viewModel.doAction(ChangePassword(
            request: const ChangePasswordRequestEntity(
          password: 'oldPassword',
          newPassword: 'newPassword',
        )));
      },
      expect: () => <ProfileViewModelState>[
            ChangePasswordLoading(),
            ChangePasswordSuccess(
                data: const ChangePasswordResponseEntity(
              token: 'token',
            )),
          ],
      verify: (_) => verify(profileUseCase.changePassword(any)).called(1));

  blocTest(
      'when change password is called it should emit [ChangePasswordLoading, ChangePasswordError',
      build: () {
        var result = Fail<ChangePasswordResponseEntity>(Exception('error'));
        when(profileUseCase.changePassword(any))
            .thenAnswer((_) async => result);
        return profileViewModelCubit;
      },
      act: (viewModel) {
        return viewModel.doAction(ChangePassword(
            request: const ChangePasswordRequestEntity(
          password: 'oldPassword',
          newPassword: 'newPassword',
        )));
      },
      expect: () => <ProfileViewModelState>[
            ChangePasswordLoading(),
            ChangePasswordError(
                error: const ErrorModel(
                    error: 'An unknown error occurred. Please try again.')),
          ],
      verify: (_) => verify(profileUseCase.changePassword(any)).called(1));
}
