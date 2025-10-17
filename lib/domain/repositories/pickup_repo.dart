// lib/domain/repositories/auth_repository.dart

import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';

abstract class PickupRepository {
  Future<PickupEntity> pickup(String pickupId);
}
