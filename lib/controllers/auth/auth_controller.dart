import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/data/models/new_user_model.dart';
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

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startTimer() {
    Logger.log("controller start timer run");
    remainingSeconds.value = 5;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        Logger.log("Timmer run remainingSeconds ${remainingSeconds.value}");
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
    // user.value = await loginUseCase.login(email, password);
    isLoading.value = false;
  }

  Future<void> forgetPassword(String email) async {
    isLoading.value = true;
    user.value = await loginUseCase.forgetPassword(email);
    isLoading.value = false;
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    user.value = await loginUseCase.verifyOtp(otp);
    isLoading.value = false;
    Get.toNamed(AppRoutes.createNewPassword);
  }

  Future<void> createNewPassword(String userId, String password) async {
    isLoading.value = true;
    user.value = await loginUseCase.createNewPassword(userId, password);
    isLoading.value = false;
  }

  //! auth

  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn.instance;
  final FacebookAuth _fb = FacebookAuth.instance;

  // ── Reactive state ─────────────────────────────────────
  final Rx<NewUserModel?> currentUser = Rx<NewUserModel?>(null);
  final RxBool isLoadingAuth = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeSignIn();
    // Listen to Firebase auth changes
    _auth.authStateChanges().listen(_handleAuthChange);
    // Initialise with current user (if any)
    if (_auth.currentUser != null) _handleAuthChange(_auth.currentUser);
  }

  void _handleAuthChange(fa.User? firebaseUser) {
    currentUser.value = firebaseUser == null
        ? null
        : NewUserModel.fromFirebaseUser(firebaseUser);
  }

  Future<void> _initializeSignIn() async {
    // String serverClientId;

    // if (F.appFlavor == Flavor.dev) {
    //   serverClientId =
    //       '677667737775-da7ijfer2vpc37koaf2oma1hs6forb2k.apps.googleusercontent.com';
    // } else if (F.appFlavor == Flavor.staging) {
    //   serverClientId =
    //       '677667737775-bc73uf4hkn2b580qhcorfffk235uvk0t.apps.googleusercontent.com';
    // } else {
    //   serverClientId =
    //       '677667737775-kh26ij3r554hk9at5gmtb73r0fpprtoh.apps.googleusercontent.com';
    // }

    try {
      await _google.initialize(
        serverClientId:
            "677667737775-8tltf5h299sros5moi98ubneof3jon3r.apps.googleusercontent.com",
      );

      await _google.attemptLightweightAuthentication();
      Logger.log('Google Sign-In initialized successfully');
    } catch (error) {
      Logger.log('Google Sign-In init failed: $error');
    }
  }

  // ── Generic credential creator ───────────────────────
  fa.AuthCredential _credentialFromProvider(
    String providerId,
    // String? accessToken,
    String? idToken,
  ) {
    switch (providerId) {
      case 'google.com':
        return fa.GoogleAuthProvider.credential(
          idToken: idToken,
        );
      case 'facebook.com':
        return fa.FacebookAuthProvider.credential(idToken!);
      case 'apple.com':
      // return fa.OAuthProvider('apple.com').credential(
      //   idToken: idToken,
      //   // accessToken: accessToken,
      // );
      case 'password':
      // return fa.EmailAuthProvider.credential(
      //   email: accessToken!, // reuse field for email
      //   password: idToken!,   // reuse field for password
      // );
      default:
        throw UnsupportedError('Provider $providerId not implemented');
    }
  }

  // ── Core sign-in method (used by all providers) ───────
  Future<void> _signInWithCredential(fa.AuthCredential credential) async {
    try {
      isLoading(true);
      final fa.UserCredential result;

      // If a user is already signed-in → link the new provider
      if (_auth.currentUser != null) {
        await _auth.currentUser!.linkWithCredential(credential);
        result = await _auth.signInWithCredential(credential);
      } else {
        result = await _auth.signInWithCredential(credential);
      }

      // Success → UI updates automatically via stream
      Get.snackbar(
          'Success', 'Signed in with ${result.credential?.providerId}');
    } on fa.FirebaseAuthException catch (e) {
      String msg;
      switch (e.code) {
        case 'account-exists-with-different-credential':
          msg = 'This account already exists with another provider. '
              'Please sign-in with the original provider first.';
          break;
        case 'credential-already-in-use':
          msg = 'This credential is already linked to another account.';
          break;
        default:
          msg = e.message ?? 'Authentication error';
      }
      Logger.log('signInWithCredential error $msg');
    } finally {
      isLoading(false);
    }
  }

  // ── Provider-specific wrappers ───────────────────────
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _google.authenticate(); // cancelled

      final googleAuth = googleUser.authentication;
      final cred = _credentialFromProvider(
        'google.com',
        googleAuth.idToken,
      );
      await _signInWithCredential(cred);

      Logger.log('signInWithGoogle success');
    } catch (e) {
      Logger.log('signInWithGoogle error: $e');
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final loginResult =
          await _fb.login(permissions: ['email', 'public_profile']);
      if (loginResult.status != LoginStatus.success) return;

      final accessToken = loginResult.accessToken!.tokenString;
      final cred = _credentialFromProvider('facebook.com', accessToken);
      await _signInWithCredential(cred);
    } catch (e) {
      Logger.log('signInWithFacebook error: $e');
    }
  }

  Future<void> signInWithApple() async {
    // Apple Sign-In requires `sign_in_with_apple` package.
    // The code is analogous: obtain nonce → idToken → OAuthProvider('apple.com')
    // Omitted for brevity – see official docs.
  }

  Future<void> signInWithEmail(String email, String password) async {
    // final cred = _credentialFromProvider('password', email, password);
    // await _signInWithCredential(cred);
  }

  // ── Sign-out (all providers) ───────────────────────
  Future<void> signOut() async {
    await _google.signOut();
    await _fb.logOut();
    await _auth.signOut();

    currentUser.value = null;

    Logger.log('signOut success');

    // currentUser will become null automatically
  }

  // ── Helper: is a provider already linked? ───────────
  bool isProviderLinked(String providerId) {
    return currentUser.value?.providers.contains(providerId) ?? false;
  }
}
