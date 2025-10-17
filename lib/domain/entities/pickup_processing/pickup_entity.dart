import 'package:phum_delivery/domain/entities/pickup_processing/confirm_entity.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/delivery_entity.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_detail_entity.dart';

class PickupEntity {
  final String id;
  final String storeName;
  final String storeAddress;
  final String customName;
  final String customAddress;
  final String date;
  final String estimatedTime;
  final String distance;

  final PickupDetailEntity pickupDetails;
  final DeliveryEntity delivery;
  final ConfirmEntity confirm;

  PickupEntity({
    required this.id,
    required this.storeName,
    required this.storeAddress,
    required this.customName,
    required this.customAddress,
    required this.date,
    required this.estimatedTime,
    required this.distance,
    required this.pickupDetails,
    required this.delivery,
    required this.confirm,
  });
}
