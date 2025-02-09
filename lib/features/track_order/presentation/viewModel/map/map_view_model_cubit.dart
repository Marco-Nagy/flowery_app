import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../../../core/networking/error/error_handler.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../../../core/services/firebase_helper/fire_store_ref_key.dart';
import '../../../domain/entities/track_order_entity.dart';
import '../../../domain/use_cases/get_order_by_order_id_case.dart';
import 'map_action.dart';

part 'map_view_model_state.dart';

@injectable
class MapViewModelCubit extends Cubit<MapViewModelState> {
  final GetOrderByOrderIdCase getOrderByOrderIdCase;

  MapViewModelCubit(
    this.getOrderByOrderIdCase,
  ) : super(MapViewModelInitial());

  TrackOrderEntity? trackOrderEntity;
  int currentStep = 0;

  Future<void> doAction(MapActions action) async {
    switch (action) {
      case GetOrderDetails():
        await _getOrderDetails(action);
    }
  }

  Future<void> _getOrderDetails(GetOrderDetails action) async {
    emit(TrackOrderViewModelLoading());
    final resultStream = await getOrderByOrderIdCase(
        orderId: action.orderId, userId: action.userId);
    resultStream.listen((result) {
      switch (result) {
        case Success<TrackOrderEntity>():
          trackOrderEntity = result.data;

          updateOrderStatus(trackOrderEntity!);
          debugPrint(' order details ${result.data.orders}');
          emit(GetTrackOrderSuccess(result.data));
        case Fail<TrackOrderEntity>():
          emit(
              TrackOrderViewModelError(ErrorHandler.handle(result.exception!)));
      }
    });
  }

  int updateOrderStatus(TrackOrderEntity trackOrderEntity) {
    switch (trackOrderEntity.orders!.state!) {
      case FireStoreRefKey.accepted:
        debugPrint(' order status name ${trackOrderEntity.orders!.state!}');
        currentStep = 1;
        break;

      case FireStoreRefKey.picked:
        currentStep = 1;
        break;

      case FireStoreRefKey.outForDelivery:
        currentStep = 2;
        break;

      case FireStoreRefKey.arrived:
        currentStep = 3;
        break;
      case FireStoreRefKey.delivered:
        currentStep = 4;
        break;

      default:
    }

    emit(UpdateStatus());
    return currentStep;
  }
}

enum OrderStatus { accepted, picked, outForDelivery, arrived, delivered }
