import '../../../domain/entities/pickup_processing/pickup_detail_entity.dart';

class PickupDetailModel extends PickupDetailEntity {
  PickupDetailModel({
    required super.id,
    required super.name,
    required super.description,
    required super.quantity,
    required super.uom,
    required super.remark,
    required super.image,
    required super.status,
  });

  factory PickupDetailModel.fromJson(Map<String, dynamic> json) {
    return PickupDetailModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
      uom: json['uom'],
      remark: json['remark'],
      image: json['image'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "quantity": quantity,
      "uom": uom,
      "remark": remark,
      "image": image,
      "status": status,
    };
  }
}
