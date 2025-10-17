import '../../../domain/entities/pickup_processing/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required super.id,
    required super.name,
    required super.role,
    required super.phone,
    required super.profile,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      phone: json['phone'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "role": role,
      "phone": phone,
      "profile": profile,
    };
  }
}
