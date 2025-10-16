class AddressEntity {
  final String id;
  final String province;
  final String district;
  final String village;
  final String commune;
  final String house;
  final String street;

  const AddressEntity({
    required this.id,
    required this.province,
    required this.district,
    required this.village,
    required this.commune,
    required this.house,
    required this.street,
  });
}
