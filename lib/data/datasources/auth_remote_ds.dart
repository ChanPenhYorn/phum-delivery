import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient client;
  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String email, String password) async {
    final response = await client.post('/login', {
      "email": email,
      "password": password,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> forgetPassword(String email) async {
    final response = await client.post('/forget-password', {
      "email": email,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> verifyOtp(String otp) async {
    final response = await client.post('/verify-otp', {
      "otp": otp,
    });

    return UserModel.fromJson(response);
  }

  Future<UserModel> createNewPassword(String userId, String password) async {
    final response = await client.post('/create-new-password', {
      "user_id": userId,
      "password": password,
    });

    return UserModel.fromJson(response);
  }
}
