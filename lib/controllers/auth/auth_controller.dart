import 'package:get/get.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/domain/usecases/auth_usecase.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';

class AuthController extends GetxController {
  final AuthUseCase loginUseCase;
  AuthController(this.loginUseCase);

  //! variables

  var isLoading = false.obs;
  var user = Rxn<UserEntity>();

  RxBool isObscure = true.obs;
  RxBool isShowClearIcon = false.obs;

  //! methods

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
}
