// lib/data/repositories/auth_repository_impl.dart

import 'package:phum_delivery/core/utils/app_logger.dart';

import 'package:phum_delivery/data/datasources/auth_remote_ds.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<UserEntity> login(String email, String password) async {
    // AppLogger.log("repo login run");
    // final userModel = await remote.login(email, password);
    final userModel = remote.login(email, password);
    return userModel;
  }

  @override
  Future<UserEntity> forgetPassword(String email) async {
    // AppLogger.log("repo forgetPassword run");
    final userModel = remote.forgetPassword(email);
    return userModel;
  }

  @override
  Future<UserEntity> verifyOtp(String otp) async {
    // AppLogger.log("repo verifyOtp run");
    final userModel = remote.verifyOtp(otp);
    return userModel;
  }

  @override
  Future<UserEntity> createNewPassword(String userId, String password) async {
    // AppLogger.log("repo createNewPassword run");
    final userModel = remote.createNewPassword(userId, password);
    return userModel;
  }
}
