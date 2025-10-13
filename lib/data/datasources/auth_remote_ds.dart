// lib/data/datasources/auth_remote_ds.dart
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
}
