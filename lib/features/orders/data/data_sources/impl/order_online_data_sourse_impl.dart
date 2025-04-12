import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/firebase_helper/fire_store_helper.dart';
import '../../../../../core/services/firebase_helper/fire_store_ref_key.dart';
import '../../../../track_order/data/mappers/track_order_mapper.dart';
import '../../../../track_order/data/models/track_order_model.dart';
import '../contracts/order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl extends OrderOnlineDataSource {
  @factoryMethod
  OrderOnlineDataSourceImpl();

  @override
  Future<DataResult<List<TrackOrderEntity>>> getOrderByUser(
      {required String userId}) async {
    try {
      final snapshot = await FireStoreService()
          .fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .get();

      final orders = snapshot.docs.map((doc) {
        final dto = TrackOrderModel.fromJson(doc.data());
        return TrackOrderMapper.toTrackOrderEntity(dto);
      }).toList();

      return Success(orders);
    } catch (e) {
      return Fail(e as Exception?);
    }
  }
}
