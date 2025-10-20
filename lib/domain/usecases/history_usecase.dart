import 'package:phum_delivery/data/models/delivery_item_model.dart';
import 'package:phum_delivery/domain/repositories/history_repo.dart';

class HistoryUseCase implements HistoryRepo {
  final HistoryRepo repository;
  HistoryUseCase(this.repository);

  @override
  Future<List<DeliveryItemModel>> historyItems(String token) {
    return repository.historyItems(token);
  }
}
