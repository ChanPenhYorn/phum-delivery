import 'dart:async';

import 'package:get/get.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/domain/usecases/auth_usecase.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';
import 'package:phum_delivery/routes/app_route.dart';

class AuthController extends GetxController {
  final AuthUseCase loginUseCase;
  AuthController(this.loginUseCase);

  //! variables

  var isLoading = false.obs;
  var user = Rxn<UserEntity>();

  RxBool isObscure = true.obs;
  RxBool isShowClearIcon = false.obs;

  Timer? timer;
  RxInt remainingSeconds = 0.obs;

  //! methods

  void startTimer() {
    AppLogger.log("controller start timer run");
    remainingSeconds.value = 5;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        AppLogger.log("Timmer run remainingSeconds ${remainingSeconds.value}");
        if (remainingSeconds.value <= 0) {
          timer.cancel();
        } else {
          remainingSeconds.value--;
        }
      },
    );
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void setShowClearIcon(bool value) {
    isShowClearIcon.value = value;
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    AppLogger.log("controller login run");
    user.value = await loginUseCase.login(email, password);
    isLoading.value = false;
  }

  Future<void> forgetPassword(String email) async {
    isLoading.value = true;
    AppLogger.log("controller forgetPassword run");
    user.value = await loginUseCase.forgetPassword(email);
    isLoading.value = false;
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    AppLogger.log("controller verifyOtp run");
    user.value = await loginUseCase.verifyOtp(otp);
    isLoading.value = false;
    Get.toNamed(AppRoutes.createNewPassword);
  }

  Future<void> createNewPassword(String userId, String password) async {
    isLoading.value = true;
    AppLogger.log("controller createNewPassword run");
    user.value = await loginUseCase.createNewPassword(userId, password);
    isLoading.value = false;
  }
}
