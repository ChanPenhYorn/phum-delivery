import 'package:phum_delivery/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.province,
    required super.district,
    required super.village,
    required super.commune,
    required super.house,
    required super.street,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'].toString(),
      province: json['province'] ?? '',
      district: json['district'] ?? '',
      village: json['village'] ?? '',
      commune: json['commune'] ?? '',
      house: json['house'] ?? '',
      street: json['street'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "province": province,
      "district": district,
      "village": village,
      "commune": commune,
      "house": house,
      "street": street,
    };
  }
}
