import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../domain/use_cases/generic_use_case.dart';
import 'generic_action.dart';

part 'generic_view_model_state.dart';

@injectable
class GenericViewModelCubit extends Cubit<GenericViewModelState> {
  @factoryMethod
  GenericViewModelCubit(this._genericUseCase)
      : super(GenericViewModelInitial());
  final GenericUseCase _genericUseCase;

  List<Items> _allItems = [];
  List<Items> _visibleItems = [];
  Set<String> items = {};
  String _currentItem = 'All';
  final int _pageSize = 5;
  bool isFetching = false;

  void doAction(GenericAction action) {
    switch (action) {
      case getData():
        _gitData(action.resourceName);
      case fetchNextPage():
        _fetchNextPage();
      case setCategory():
        _setCategory(action.category);
    }
  }

  void _gitData(String resourceName) async {
    emit(GenericItemLoadedState());
    _allItems.clear();
    _visibleItems.clear();
    items.clear();

    try {
      var result = await _genericUseCase.getAllItems(resourceName);

      switch (result) {
        case Success<GenericResponseEntity>():
          _allItems = result.data.items ?? [];
          items.add('All');
          items
              .addAll(_allItems.map((item) => item.name ?? 'Unknown').toSet());
          _updateVisibleItems();
          break;
        case Fail<GenericResponseEntity>():
          final message = ErrorHandler.handle(result.exception!);
          emit(GenericItemErrorState(message));
          break;
      }
    } catch (e) {
      emit(CatalogErrorState('An error occurred'));
    }
  }

  void _fetchNextPage() {
    if (isFetching || _visibleItems.length >= _allItems.length) return;

    isFetching = true;

    Future.delayed(const Duration(milliseconds: 500), () {
      _updateVisibleItems();
      isFetching = false;
    });
  }

  void _setCategory(String category) {
    _currentItem = category;
    _updateVisibleItems();
  }

  void _updateVisibleItems() {
    final filteredItems = _currentItem == 'All'
        ? _allItems
        : _allItems.where((item) => item.name == _currentItem).toList();

    int nextCount =
        (_visibleItems.length + _pageSize).clamp(0, filteredItems.length);
    _visibleItems = filteredItems.sublist(0, nextCount);
    emit(GenericItemSuccessState(_visibleItems.cast<Items>()));
  }
}
