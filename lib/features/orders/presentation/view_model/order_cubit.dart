import 'package:bloc/bloc.dart';
import 'package:flowery_store/features/orders/domain/entities/order_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../../track_order/domain/entities/track_order_entity.dart';
import '../../domain/use_cases/order_use_case.dart';
import 'order_action.dart';

part 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase _orderUseCase;
  @factoryMethod
   List<Orders> orders = [];

  OrderCubit(this._orderUseCase) : super(OrderInitial());

  void doAction(OrderAction action) {
    switch (action) {
      case GetOrdersByUser():
        _getOrdersByUser (action);
    }
  }


  Future<void> _getOrdersByUser(GetOrdersByUser action) async {
    emit(OrderLoading());

    final result = await _orderUseCase(userId: action.userId);

    switch (result) {
      case Success<List<TrackOrderEntity>>():
        final allOrders = result.data;

        final filteredOrders = allOrders.where((order) {
          return order.orders?.state == action.status;
        }).toList();

        emit(GetOrderByUserSuccess(filteredOrders));
        break;

      case Fail<List<TrackOrderEntity>>():
        emit(OrderError(error: ErrorHandler.handle(result.exception!)));
        break;
    }
  }





}
