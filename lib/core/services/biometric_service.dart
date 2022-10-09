// import 'package:easy_localization/easy_localization.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:trakref/core/error/failures.dart';

// class BiometricService {
//   final LocalAuthentication localAuthentication;

//   BiometricService(this.localAuthentication);

//   Future<bool> isBiometricAvailable() async {
//     return await localAuthentication.canCheckBiometrics;
//   }

//   Future<bool> localAuthenticated(
//       {bool allowBiomatricsID = false, bool checkAllowBio = false}) async {
//     List<BiometricType> availableBiometrics =
//         await localAuthentication.getAvailableBiometrics();
//     bool canCheckBiometric =
//         checkAllowBio ? true : await isBiometricAvailable();
//     bool isAuthenticated = false;
//     if (canCheckBiometric) {
//       if (allowBiomatricsID || checkAllowBio) {
//         if (availableBiometrics.contains(BiometricType.face)) {
//           try {
//             isAuthenticated = await localAuthentication.authenticate(
//               biometricOnly: true,
//               localizedReason: tr("kpermissionLoginFaceID"),
//               useErrorDialogs: true,
//               stickyAuth: true,
//             );
//           } catch (e) {
//             throw const CacheFailure("cannot use face id");
//           }
//         } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
//           try {
//             isAuthenticated = await localAuthentication.authenticate(
//               biometricOnly: true,
//               localizedReason: tr("kPermissionLoginTouchID"),
//               useErrorDialogs: true,
//               stickyAuth: true,
//             );
//           } catch (e) {
//             throw const CacheFailure("cannot use finger print");
//           }
//         }
//       }
//     }
//     if (!isAuthenticated) {
//       localAuthentication.stopAuthentication();
//     }
//     return isAuthenticated;
//   }
// }
