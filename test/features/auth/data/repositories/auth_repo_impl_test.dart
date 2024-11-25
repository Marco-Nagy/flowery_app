import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/auth_online_data_source.dart';
import 'package:flowery_e_commerce/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/signup_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthOnlineDataSource])
void main() {
  late MockAuthOnlineDataSource mockOnlineDataSource;
  late AuthRepositoryImpl authRepository;

  setUpAll(() {
    provideDummy<DataResult<SignUpResponseEntity>>(
        Success(SignUpResponseEntity()));
  });

  setUp(() {
    mockOnlineDataSource = MockAuthOnlineDataSource();
    authRepository = AuthRepositoryImpl(mockOnlineDataSource);
  });

  group('signUp', () {
    final requestEntity = SignUpRequestEntity(
      firstName: 'haidy',
      lastName: 'hesham',
      email: 'haidy@gmail.com',
      password: 'password123',
      rePassword: 'password123',
      phone: '1234567890',
      gender: 'female',
    );

    final responseEntity = SignUpResponseEntity(
      message: 'Sign-up successful',
      error: null,
      token: 'token',
      user: User(
        firstName: 'haidy',
        lastName: 'hesham',
        email: 'haidy@gmail.com',
        gender: 'female',
        phone: '1234567890',
        role: 'user',
        id: 'user-id',
        createdAt: '2024-11-19',
      ),
    );

    test('should call signUp on the data source with correct data', () async {
      when(mockOnlineDataSource.signUp(request: requestEntity))
          .thenAnswer((_) async => Success(responseEntity));

      final result = await authRepository.signUp(request: requestEntity);

      expect(result, isA<DataResult<SignUpResponseEntity>>());
      expect((result as Success).data, equals(responseEntity));
    });

    test('should handle errors correctly', () async {
      final exception = Exception('SignUpFailed');
      when(mockOnlineDataSource.signUp(request: requestEntity))
          .thenAnswer((_) async => Fail(exception));

      final result = await authRepository.signUp(request: requestEntity);

      expect(result, isA<Fail<SignUpResponseEntity>>());
      expect((result as Fail).exception, equals(exception));
    });
  });
}
