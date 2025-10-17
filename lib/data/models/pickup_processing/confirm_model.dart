import '../../../domain/entities/pickup_processing/confirm_entity.dart';

class ConfirmModel extends ConfirmEntity {
  ConfirmModel({
    required super.id,
    required super.approveBy,
    required super.issueBy,
    required super.deliveryBy,
    required super.confirmDate,
    required super.phone,
  });

  factory ConfirmModel.fromJson(Map<String, dynamic> json) {
    return ConfirmModel(
      id: json['id'],
      approveBy: json['approveBy'],
      issueBy: json['issueBy'],
      deliveryBy: json['deliveryBy'],
      confirmDate: json['confirmDate'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "approveBy": approveBy,
      "issueBy": issueBy,
      "deliveryBy": deliveryBy,
      "confirmDate": confirmDate,
      "phone": phone,
    };
  }
}
