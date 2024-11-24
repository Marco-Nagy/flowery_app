import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/use_cases/most_selling_use_case.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_seller_states.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'most_selling_cubit_test.mocks.dart';
@GenerateMocks([MostSellingProductsUseCase])
void main() {
  late MostSellingProductsUseCase mostSellingProductsUseCase;
  late MostSellerCubit mostSellerCubit;
  setUp(()async{
 mostSellingProductsUseCase = MockMostSellingProductsUseCase();
 mostSellerCubit = MostSellerCubit(mostSellingProductsUseCase);
  });
  // 1 - test for get most seller success

  blocTest<MostSellerCubit, MostSellerStates>(
    'when call getMostSellers function it should call getMostSellers from use case and change '
        'state with the right sequence',
    build: () {
      var title = '';
      var imageCover = '';
      var price = 220;
      var priceAfterDiscount = 180;
      var mockedResult =
      Success<List<MostSellingProducts>>([MostSellingProducts(title: title, imageCover: imageCover, price: price, priceAfterDiscount: priceAfterDiscount)]);
      provideDummy<DataResult<List<MostSellingProducts>>>(mockedResult);
      when(mostSellingProductsUseCase.call()).thenAnswer(
            (_) async => mockedResult,
      );
      return mostSellerCubit;
    },
    act: (mostSellerCubit) {
      mostSellerCubit.getMostSellers();
    },
    expect: () {
      verify(mostSellingProductsUseCase.call()).called(1);
      return [
        isA<GetMostSellerLoadingState>(),
        isA<GetMostSellerSuccessState>(),
      ];
    },
  );

  // 1 - test for get most seller fail

  blocTest<MostSellerCubit, MostSellerStates>(
    'when call getMostSellers function  returns fail  it should emit Error state',
    build: () {
      var mockedResult =
      Fail<List<MostSellingProducts>>(Exception());
      provideDummy<DataResult<List<MostSellingProducts>>>(mockedResult);
      when(mostSellingProductsUseCase.call()).thenAnswer(
            (_) async => mockedResult,
      );
      return mostSellerCubit;
    },
    act: (mostSellerCubit) {
      mostSellerCubit.getMostSellers();
    },
    expect: () {
      verify(mostSellingProductsUseCase.call()).called(1);
      return [
        isA<GetMostSellerLoadingState>(),
        isA<GetMostSellerErrorState>(),
      ];
    },
  );


}