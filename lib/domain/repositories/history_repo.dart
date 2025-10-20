import 'package:phum_delivery/data/models/delivery_item_model.dart';

abstract class HistoryRepo {
  Future<List<DeliveryItemModel>> historyItems(String token);
}
