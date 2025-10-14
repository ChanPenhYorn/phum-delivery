// lib/data/repositories/auth_repository_impl.dart

import 'package:phum_delivery/core/utils/app_logger.dart';

import 'package:phum_delivery/data/datasources/home_remote_ds.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDs remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<UserEntity> userProfile(String token) async {
    // AppLogger.log("repo userProfile run");
    // final userModel = await remote.userProfile(token);
    final userModel = remote.userProfile(token);
    return userModel;
  }

  @override
  Future<List<DeliveryItemEntity>> deliveryItems(String token) {
    final deliveryItems = remote.deliveryItems(token);
    return deliveryItems;
  }
}
