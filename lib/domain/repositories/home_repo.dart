// lib/domain/repositories/auth_repository.dart

import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';

abstract class HomeRepository {
  Future<UserEntity> userProfile(String token);
  Future<List<DeliveryItemEntity>> deliveryItems(String token);
}
