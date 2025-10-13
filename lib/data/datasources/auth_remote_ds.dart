// lib/data/datasources/auth_remote_ds.dart
import 'package:phum_delivery/core/utils/app_logger.dart';

import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient client;
  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String email, String password) async {
    AppLogger.log("remote login run");
    final response = await client.post('/login', {
      "email": email,
      "password": password,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> forgetPassword(String email) async {
    AppLogger.log("remote forgetPassword run");
    final response = await client.post('/forget-password', {
      "email": email,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> verifyOtp(String otp) async {
    AppLogger.log("remote verifyOtp run");
    final response = await client.post('/verify-otp', {
      "otp": otp,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> createNewPassword(String userId, String password) async {
    AppLogger.log("remote createNewPassword run");
    final response = await client.post('/create-new-password', {
      "user_id": userId,
      "password": password,
    });

    return UserModel.fromJson(response);
  }
}
