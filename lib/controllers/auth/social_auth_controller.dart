// // lib/controllers/auth_controller.dart
// import 'package:firebase_auth/firebase_auth.dart' as fa;
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:phum_delivery/data/models/new_user_model.dart';

// class AuthController extends GetxController {
//   static AuthController get instance => Get.find();

//   final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;
//   final GoogleSignIn _google = GoogleSignIn.instance;
//   final FacebookAuth _fb = FacebookAuth.instance;

//   // ── Reactive state ─────────────────────────────────────
//   final Rx<NewUserModel?> currentUser = Rx<NewUserModel?>(null);
//   final RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen to Firebase auth changes
//     _auth.authStateChanges().listen(_handleAuthChange);
//     // Initialise with current user (if any)
//     if (_auth.currentUser != null) _handleAuthChange(_auth.currentUser);
//   }

//   void _handleAuthChange(fa.User? firebaseUser) {
//     currentUser.value = firebaseUser == null
//         ? null
//         : NewUserModel.fromFirebaseUser(firebaseUser);
//   }

//   // ── Generic credential creator ───────────────────────
//   fa.AuthCredential _credentialFromProvider(
//     String providerId,
//     // String? accessToken,
//     String? idToken,
//   ) {
//     switch (providerId) {
//       case 'google.com':
//         return fa.GoogleAuthProvider.credential(
//           idToken: idToken,
//         );
//       case 'facebook.com':
//         return fa.FacebookAuthProvider.credential(idToken!);
//       case 'apple.com':
//         return fa.OAuthProvider('apple.com').credential(
//           idToken: idToken,
//           // accessToken: accessToken,
//         );
//       case 'password':
//       // return fa.EmailAuthProvider.credential(
//       //   email: accessToken!, // reuse field for email
//       //   password: idToken!,   // reuse field for password
//       // );
//       default:
//         throw UnsupportedError('Provider $providerId not implemented');
//     }
//   }

//   // ── Core sign-in method (used by all providers) ───────
//   Future<void> _signInWithCredential(fa.AuthCredential credential) async {
//     try {
//       isLoading(true);
//       final fa.UserCredential result;

//       // If a user is already signed-in → link the new provider
//       if (_auth.currentUser != null) {
//         await _auth.currentUser!.linkWithCredential(credential);
//         result = await _auth.signInWithCredential(credential);
//       } else {
//         result = await _auth.signInWithCredential(credential);
//       }

//       // Success → UI updates automatically via stream
//       Get.snackbar(
//           'Success', 'Signed in with ${result.credential?.providerId}');
//     } on fa.FirebaseAuthException catch (e) {
//       String msg;
//       switch (e.code) {
//         case 'account-exists-with-different-credential':
//           msg = 'This account already exists with another provider. '
//               'Please sign-in with the original provider first.';
//           break;
//         case 'credential-already-in-use':
//           msg = 'This credential is already linked to another account.';
//           break;
//         default:
//           msg = e.message ?? 'Authentication error';
//       }
//       Get.snackbar('Error', msg, snackPosition: SnackPosition.BOTTOM);
//     } finally {
//       isLoading(false);
//     }
//   }

//   // ── Provider-specific wrappers ───────────────────────
//   Future<void> signInWithGoogle() async {
//     try {
//       final googleUser = await _google.authenticate(); // cancelled

//       final googleAuth = googleUser.authentication;
//       final cred = _credentialFromProvider(
//         'google.com',
//         googleAuth.idToken,
//       );
//       await _signInWithCredential(cred);
//     } catch (e) {
//       Get.snackbar('Google Error', e.toString());
//     }
//   }

//   Future<void> signInWithFacebook() async {
//     try {
//       final loginResult =
//           await _fb.login(permissions: ['email', 'public_profile']);
//       if (loginResult.status != LoginStatus.success) return;

//       final accessToken = loginResult.accessToken!.tokenString;
//       final cred = _credentialFromProvider('facebook.com', accessToken);
//       await _signInWithCredential(cred);
//     } catch (e) {
//       Get.snackbar('Facebook Error', e.toString());
//     }
//   }

//   Future<void> signInWithApple() async {
//     // Apple Sign-In requires `sign_in_with_apple` package.
//     // The code is analogous: obtain nonce → idToken → OAuthProvider('apple.com')
//     // Omitted for brevity – see official docs.
//   }

//   Future<void> signInWithEmail(String email, String password) async {
//     // final cred = _credentialFromProvider('password', email, password);
//     // await _signInWithCredential(cred);
//   }

//   // ── Sign-out (all providers) ───────────────────────
//   Future<void> signOut() async {
//     await _google.signOut();
//     await _fb.logOut();
//     await _auth.signOut();
//     // currentUser will become null automatically
//   }

//   // ── Helper: is a provider already linked? ───────────
//   bool isProviderLinked(String providerId) {
//     return currentUser.value?.providers.contains(providerId) ?? false;
//   }
// }
