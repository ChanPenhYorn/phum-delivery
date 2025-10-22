// // lib/models/user_model.dart
// import 'package:firebase_auth/firebase_auth.dart' as fa;

// class NewUserModel {
//   final String uid;
//   final String? displayName;
//   final String? email;
//   final String? photoURL;
//   final List<String> providers; // e.g. ['google.com', 'facebook.com']

//   NewUserModel({
//     required this.uid,
//     this.displayName,
//     this.email,
//     this.photoURL,
//     required this.providers,
//   });

//   // Convert Firebase User → our model
//   factory NewUserModel.fromFirebaseUser(fa.User firebaseUser) {
//     return NewUserModel(
//       uid: firebaseUser.uid,
//       displayName: firebaseUser.displayName,
//       email: firebaseUser.email,
//       photoURL: firebaseUser.photoURL,
//       providers:
//           firebaseUser.providerData.map((info) => info.providerId).toList(),
//     );
//   }

//   // Helper
//   bool get isAnonymous => providers.contains('anonymous');
// }
