import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/models/delivery_item_model.dart';

class HistoryRemoteDs {
  final ApiClient client;
  HistoryRemoteDs(this.client);

  Future<List<DeliveryItemModel>> historyItems(String token) async {
    // Logger.log("remote deliveryItems run");
    // final response = await client.get('/delivery-items', headers: {
    //   'Authorization': 'Bearer $token',
    // });

    final List<Map<String, dynamic>> items = [
      {
        "id": 1,
        "name": "Item 1",
        "description": "Description 1",
        "image": "assets/svg/default_delivery.svg",
        "total": 10,
        "status": "Confirm",
        "createdAt": "2025-10-14 12:00:00",
      },
      {
        "id": 2,
        "name": "Item 2",
        "description": "Description 2",
        "image": "assets/svg/default_delivery.svg",
        "total": 20,
        "status": "Canceled",
        "createdAt": "2025-01-01 12:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Confirm",
        "createdAt": "2025-01-01 12:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Confirm",
        "createdAt": "2025-01-01 10:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Confirm",
        "createdAt": "2025-01-01 11:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Canceled",
        "createdAt": "2025-01-01 13:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Confirm",
        "createdAt": "2025-01-01 14:00:00",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "Confirm",
        "createdAt": "2025-01-01 15:00:00",
      },
    ];

    return items.map((e) => DeliveryItemModel.fromJson(e)).toList();
  }
}
