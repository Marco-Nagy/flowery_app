import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../best_seller_cubit/best_seller_cubit_test.mocks.dart';


@GenerateMocks([HomeUseCase])
void main() {
  late HomeUseCase homeUseCase;
  late OccasionsCubit occasionsCubit;
  setUp(()async{
    homeUseCase = MockHomeUseCase();
    occasionsCubit = OccasionsCubit(homeUseCase);
  });

  // 1 - test for get occasions success

  blocTest<OccasionsCubit, OccasionsStates>(
    'when call getOccasions function it should call getOccasions from useCase and change '
        'state with the right sequence',
    build: () {
      var name = 'wedding';
      var image = 'https://flower.elevateegy.com/uploads/da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg';
      var mockedResult =
      Success<List<Occasions>>([Occasions(name: name, image: image)]);
      provideDummy<DataResult<List<Occasions>>>(mockedResult);
      when(homeUseCase.callOccasions()).thenAnswer(
            (_) async => mockedResult,
      );
      return occasionsCubit;
    },
    act: (occasionsCubit) {
      occasionsCubit.getOccasions();
    },
    expect: () {
      verify(homeUseCase.callOccasions()).called(1);
      return [
        isA<GetOccasionsLoadingState>(),
        isA<GetOccasionsSuccessState>(),
      ];
    },
  );

  // 1 - test for get occasions fail

  blocTest<OccasionsCubit, OccasionsStates>(
    'when call getOccasions function  returns fail  it should emit Error state',
    build: () {
      var mockedResult =
      Fail<List<Occasions>>(Exception());
      provideDummy<DataResult<List<Occasions>>>(mockedResult);
      when(homeUseCase.callOccasions()).thenAnswer(
            (_) async => mockedResult,
      );
      return occasionsCubit;
    },
    act: (occasionsCubit) {
      occasionsCubit.getOccasions();
    },
    expect: () {
      verify(homeUseCase.callOccasions()).called(1);
      return [
        isA<GetOccasionsLoadingState>(),
        isA<GetOccasionsErrorState>(),
      ];
    },
  );

}