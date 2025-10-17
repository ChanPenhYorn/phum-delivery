import 'package:phum_delivery/data/models/pickup_processing/confirm_model.dart';
import 'package:phum_delivery/data/models/pickup_processing/delivery_model.dart';

import '../../../domain/entities/pickup_processing/pickup_entity.dart';
import 'pickup_detail_model.dart';

class PickupModel extends PickupEntity {
  PickupModel({
    required super.id,
    required super.storeName,
    required super.storeAddress,
    required super.customName,
    required super.customAddress,
    required super.date,
    required super.estimatedTime,
    required super.distance,
    required super.pickupDetails,
    required super.delivery,
    required super.confirm,
  });

  factory PickupModel.fromJson(Map<String, dynamic> json) {
    return PickupModel(
      id: json['id'],
      storeName: json['storeName'],
      storeAddress: json['storeAddress'],
      customName: json['customName'],
      customAddress: json['customAddress'],
      date: json['date'],
      estimatedTime: json['estimatedTime'],
      distance: json['distance'],
      pickupDetails: PickupDetailModel.fromJson(json['pickupDetails']),
      delivery: DeliveryModel.fromJson(json['delivery']),
      confirm: ConfirmModel.fromJson(json['confirm']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "storeName": storeName,
      "storeAddress": storeAddress,
      "customName": customName,
      "customAddress": customAddress,
      "date": date,
      "estimatedTime": estimatedTime,
      "distance": distance,
    };
  }
}
