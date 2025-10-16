import 'package:phum_delivery/domain/entities/address_entity.dart';

class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String profile;
  final String phone;
  final String dateOfBirth;

  final AddressEntity address;
  final String createdAt;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profile,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.createdAt,
  });
}
