import 'dart:async';

import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/core/services/firebase_helper/fire_store_helper.dart';
import 'package:flowery_store/core/services/firebase_helper/fire_store_ref_key.dart';
import 'package:flowery_store/features/track_order/data/data_sources/contracts/track_order_online_data_source.dart';
import 'package:flowery_store/features/track_order/data/mappers/track_order_mapper.dart';
import 'package:flowery_store/features/track_order/data/models/track_order_model.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackOrderOnlineDataSource)
class TrackOrderOnlineDataSourceImpl implements TrackOrderOnlineDataSource {


  @factoryMethod
  TrackOrderOnlineDataSourceImpl( );

  @override
  Stream<DataResult<TrackOrderEntity>> getOrderByOrderId({
    required String userId,
    required String orderId,
  }) {
    try {
      debugPrint(' getOrderDetails **  user id ${ userId} - order id ${orderId}');
      return FireStoreService().fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .doc(orderId)
            .snapshots()
          .map(
        (event) {
          debugPrint('event data ${event.data()}');
          final trackOrderDto =
              TrackOrderModel.fromJson(event.data() as Map<String, dynamic>);
          final orderEntity =
              TrackOrderMapper.toTrackOrderEntity(trackOrderDto);

          return Success(orderEntity);
        },
      );
    } catch (e) {
      return Stream.value(Fail<TrackOrderEntity>(e as Exception?));
    }
  }
}

