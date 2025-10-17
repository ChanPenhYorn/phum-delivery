class PickupDetailEntity {
  final String id;
  final String name;
  final String description;
  final String quantity;
  final String uom;
  final String remark;
  final String image;
  final String status;

  PickupDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.uom,
    required this.remark,
    required this.image,
    required this.status,
  });
}
