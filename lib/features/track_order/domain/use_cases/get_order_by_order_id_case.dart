import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flowery_e_commerce/features/track_order/domain/repositories/contract/track_order_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderByOrderIdCase {
  final TrackOrderRepo _repository;

  GetOrderByOrderIdCase(this._repository);

  Future<Stream<DataResult<TrackOrderEntity>>> call(
      {required String userId, required String orderId}) async {
    return  _repository.getOrderByOrderId(
        userId: userId, orderId: orderId);
  }
}
