// lib/domain/usecases/login_usecase.dart
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/data/repositories/auth_repo.dart';

import '../repositories/auth_repo.dart';
import '../entities/user_entity.dart';

class AuthUseCase implements AuthRepository {
  final AuthRepositoryImpl repository;
  AuthUseCase(this.repository);

  final AppLogger logger = AppLogger();

  @override
  Future<UserEntity> login(String email, String password) {
    AppLogger.log("usecase login run");
    // return throw UnimplementedError();
    return repository.login(email, password);
  }

  @override
  Future<UserEntity> forgetPassword(String email) {
    AppLogger.log("usecase forgetPassword run");
    // return throw UnimplementedError();
    return repository.forgetPassword(email);
  }

  @override
  Future<UserEntity> verifyOtp(String otp) {
    AppLogger.log("usecase verifyOtp run");
    // return throw UnimplementedError();
    return repository.verifyOtp(otp);
  }

  @override
  Future<UserEntity> createNewPassword(String userId, String password) {
    AppLogger.log("usecase createNewPassword run");
    // return throw UnimplementedError();
    return repository.createNewPassword(userId, password);
  }
}
