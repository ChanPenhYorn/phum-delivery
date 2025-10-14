import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';

class DeliveryItemModel extends DeliveryItemEntity {
  const DeliveryItemModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.total,
    required super.status,
    required super.createdAt,
  });

  factory DeliveryItemModel.fromJson(Map<String, dynamic> json) {
    return DeliveryItemModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      total: json['total'] ?? 0,
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "image": image,
      "total": total,
      "status": status,
      "createdAt": createdAt,
    };
  }
}
