import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/features/orders/domain/entities/order_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../domain/use_cases/order_use_case.dart';
import 'order_action.dart';

part 'order_state.dart';
@injectable
class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase _orderUseCase;
  @factoryMethod

  OrderCubit(this._orderUseCase) : super(OrderInitial());

  void doAction(OrderAction action) {
    switch (action) {
      case GetOrders():
        _getAUserOrders();
    }
  }

  Future<void> _getAUserOrders() async {
    emit(OrderLoading());
    final result = await _orderUseCase.getOrders();
    switch (result) {
      case Success<OrderResponseEntity>():
        emit(OrderSuccess(
            orders: result.data.orders ?? []));
      case Fail<OrderResponseEntity>():
        emit(OrderError(
            error: ErrorHandler.handle(result.exception!)));
    }
  }
}
