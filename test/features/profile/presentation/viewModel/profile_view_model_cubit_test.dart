import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/offline_data_source.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
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
      GetLoggedUserDataError(error: ErrorModel(error: 'An unknown error occurred. Please try again.')),
    ],
    verify: (_) => verify(profileUseCase.getProfileData()).called(1),
  );
}
