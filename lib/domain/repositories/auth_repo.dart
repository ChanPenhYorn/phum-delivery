// lib/domain/repositories/auth_repository.dart

import 'package:phum_delivery/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
}
