import 'package:phum_delivery/data/datasources/pickup_remote_ds.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';
import 'package:phum_delivery/domain/repositories/pickup_repo.dart';

class PickupRepositoryImpl implements PickupRepository {
  final PickupRemoteDs remote;

  PickupRepositoryImpl(this.remote);

  @override
  Future<PickupEntity> pickup(String pickupId) {
    final pickup = remote.pickup(pickupId);
    return pickup;
  }
}
