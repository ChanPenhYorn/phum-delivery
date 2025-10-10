// lib/domain/usecases/login_usecase.dart
import 'package:getx_mvvm_architecture/core/utils/app_logger.dart';
import 'package:getx_mvvm_architecture/data/repositories/auth_repo.dart';

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
}
