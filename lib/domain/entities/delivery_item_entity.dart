class DeliveryItemEntity {
  final String id;
  final String name;
  final String description;
  final String image;
  final int total;
  final String status;
  final String createdAt;

  const DeliveryItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.total,
    required this.status,
    required this.createdAt,
  });
}
