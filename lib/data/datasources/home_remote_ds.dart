import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/models/delivery_item_model.dart';
import 'package:phum_delivery/data/models/user_model.dart';

class HomeRemoteDs {
  final ApiClient client;
  HomeRemoteDs(this.client);

  Future<UserModel> userProfile(String token) async {
    final response = {
      "id": 001,
      "firstName": "Chan",
      "lastName": "Dara",
      "email": "chandara@gmail.com",
      "dateOfBirth": "2025-10-14",
      "profile":
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?ixlib=rb-4.1.0",
      "phone": "1234567890",
      "address": {
        "province": "123 Main St",
        "district": "City",
        "commune": "State",
        "village": "123 Main St",
        "house": "12345",
        "street": "123 Main St",
      },
    };

    return UserModel.fromJson(response);
  }

  Future<List<DeliveryItemModel>> deliveryItems(String token) async {
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
        "status": "new",
        "createdAt": "2025-10-14",
      },
      {
        "id": 2,
        "name": "Item 2",
        "description": "Description 2",
        "image": "assets/svg/default_delivery.svg",
        "total": 20,
        "status": "old",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
      {
        "id": 3,
        "name": "Item 3",
        "description": "Description 3",
        "image": "assets/svg/default_delivery.svg",
        "total": 30,
        "status": "new",
        "createdAt": "2025-01-01",
      },
    ];

    return items.map((e) => DeliveryItemModel.fromJson(e)).toList();
  }
}
