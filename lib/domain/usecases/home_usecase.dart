// lib/domain/usecases/login_usecase.dart

import 'package:phum_delivery/data/repositories/home_repo.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';

import '../repositories/home_repo.dart';

class HomeUseCase implements HomeRepository {
  final HomeRepositoryImpl repository;
  HomeUseCase(this.repository);

  @override
  Future<List<DeliveryItemEntity>> deliveryItems(String token) {
    return repository.deliveryItems(token);
  }

  @override
  Future<UserEntity> userProfile(String token) {
    return repository.userProfile(token);
  }
}
