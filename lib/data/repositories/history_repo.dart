import 'package:phum_delivery/data/models/delivery_item_model.dart';
import 'package:phum_delivery/domain/repositories/history_repo.dart';

import '../datasources/history_remote_ds.dart';

class HistoryRepoImpl implements HistoryRepo {
  final HistoryRemoteDs remoteDs;
  HistoryRepoImpl(this.remoteDs);

  @override
  Future<List<DeliveryItemModel>> historyItems(String token) {
    return remoteDs.historyItems(token);
  }
}
