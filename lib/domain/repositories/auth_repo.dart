// lib/domain/repositories/auth_repository.dart

import 'package:getx_mvvm_architecture/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
}
