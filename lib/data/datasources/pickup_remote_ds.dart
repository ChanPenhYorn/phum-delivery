import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/models/pickup_processing/confirm_model.dart';
import 'package:phum_delivery/data/models/pickup_processing/delivery_model.dart';
import 'package:phum_delivery/data/models/pickup_processing/pickup_detail_model.dart';
import 'package:phum_delivery/data/models/pickup_processing/pickup_model.dart';

class PickupRemoteDs {
  final ApiClient client;
  PickupRemoteDs(this.client);

  Future<PickupModel> pickup(String token) async {
    // final response = await client.get('/pickups', headers: {
    //   'Authorization': 'Bearer $token',
    // });

    final PickupModel data = PickupModel(
      id: 'PICKUP_20251014_001',
      confirm: ConfirmModel(
        id: 'CONF_20251014_001',
        approveBy: 'Chanda Sreyvath',
        issueBy: 'Chanpenh Vong',
        deliveryBy: 'Sokha Mean',
        confirmDate: '2025-10-14T10:30:00+07:00',
        phone: '+855 12 345 678',
      ),
      delivery: DeliveryModel(
        id: 'DRV_20251014_001',
        name: 'Sokha Mean',
        role: 'Delivery Driver',
        phone: '+855 17 234 567',
        profile:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&fit=crop&crop=face',
      ),
      pickupDetails: PickupDetailModel(
        id: 'ITEM_20251014_001',
        name: 'Arduino Development Kit - Premium',
        description:
            'Complete Arduino Uno R4 + sensors, actuators, breadboard, jumper wires, and LCD display for IoT prototyping',
        quantity: '12',
        uom: 'kits',
        remark:
            'Fragile electronics - requires padded packaging and careful handling',
        image:
            'https://images.unsplash.com/photo-1558618047-3c8c76bd413a?w=800&fit=crop',
        status: 'Processing',
      ),
      storeName: 'TechNova Electronics Hub',
      storeAddress:
          'No. 123, Preah Monivong Blvd, Sangkat Boeung Keng Kang 1, Khan Chamkarmon, Phnom Penh 12345, Cambodia',
      customName: 'Digital Innovation Solutions Co., Ltd.',
      customAddress:
          'Building 456, Street 217, Toul Kork, Phnom Penh 12152, Cambodia',
      date: '2025-10-14T14:00:00+07:00',
      estimatedTime: '2025-10-14T16:45:00+07:00',
      distance: '7.8',
    );

    return data;
  }
}
