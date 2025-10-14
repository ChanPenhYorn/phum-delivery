class UserEntity {
  final String id;
  final String name;
  final String email;
  final String profile;
  final String phone;
  final String address;
  final String createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profile,
    required this.phone,
    required this.address,
    required this.createdAt,
  });
}
