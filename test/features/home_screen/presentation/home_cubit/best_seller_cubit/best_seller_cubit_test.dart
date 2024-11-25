import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'best_seller_cubit_test.mocks.dart';

@GenerateMocks([HomeUseCase])
void main() {
  late HomeUseCase homeUseCase;
  late BestSellerCubit bestSellerCubit;
  setUp(()async{
    homeUseCase = MockHomeUseCase();
    bestSellerCubit = BestSellerCubit(homeUseCase);
  });

    // 1 - test for get best seller success

    blocTest<BestSellerCubit, BestSellerStates>(
      'when call getBestSellers function it should call getBestSellers from useCase and change '
          'state with the right sequence',
      build: () {
        var title = '';
        var imageCover = '';
        var price = 220;
        var mockedResult =
        Success<List<BestSeller>>([BestSeller(title: title, imageCover: imageCover, price: price)]);
        provideDummy<DataResult<List<BestSeller>>>(mockedResult);
        when(homeUseCase.callBestSellers()).thenAnswer(
              (_) async => mockedResult,
        );
        return bestSellerCubit;
      },
      act: (bestSellerCubit) {
         bestSellerCubit.getBestSellers();
      },
      expect: () {
        verify(homeUseCase.callBestSellers()).called(1);
        return [
          isA<GetBestSellerLoadingState>(),
          isA<GetBestSellerSuccessState>(),
        ];
      },
    );

  // 1 - test for get best seller fail

  blocTest<BestSellerCubit, BestSellerStates>(
      'when call getBestSellers function  returns fail  it should emit Error state',
      build: () {
        var mockedResult =
        Fail<List<BestSeller>>(Exception());
        provideDummy<DataResult<List<BestSeller>>>(mockedResult);
        when(homeUseCase.callBestSellers()).thenAnswer(
              (_) async => mockedResult,
        );
        return bestSellerCubit;
      },
      act: (bestSellerCubit) {
         bestSellerCubit.getBestSellers();
      },
      expect: () {
        verify(homeUseCase.callBestSellers()).called(1);
        return [
          isA<GetBestSellerLoadingState>(),
          isA<GetBestSellerErrorState>(),
        ];
      },
    );

}