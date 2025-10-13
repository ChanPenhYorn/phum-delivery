// lib/domain/repositories/auth_repository.dart

import 'package:phum_delivery/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> forgetPassword(String email);
  Future<UserEntity> verifyOtp(String otp);
  Future<UserEntity> createNewPassword(String userId, String password);
}
