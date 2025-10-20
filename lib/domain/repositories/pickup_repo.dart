// lib/domain/repositories/auth_repository.dart

import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';

abstract class PickupRepository {
  Future<PickupEntity> pickup(String pickupId);
  Future<List<DeliveryItemEntity>> searchPickup(String pickupId);
}
