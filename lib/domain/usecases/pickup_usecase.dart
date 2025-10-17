// lib/domain/usecases/login_usecase.dart

import 'package:phum_delivery/data/repositories/pickup_repo.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';

import '../repositories/pickup_repo.dart';

class PickupUseCase implements PickupRepository {
  final PickupRepositoryImpl repository;
  PickupUseCase(this.repository);

  @override
  Future<PickupEntity> pickup(String pickupId) {
    return repository.pickup(pickupId);
  }
}
