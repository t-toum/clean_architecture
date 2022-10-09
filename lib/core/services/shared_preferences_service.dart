// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trakref/core/entities/account.dart';
// import 'package:trakref/core/models/info_user_model.dart';
// import 'package:trakref/core/services/trakref_api_service.dart';

// class SharedPrefKeys {
//   SharedPrefKeys._();

//   static const String boolValue = "boolValue";
// }

// class SharePreferencesDataSource {
//   final SharedPreferences sharedPrefService;

//   SharePreferencesDataSource({required this.sharedPrefService});

//   //wrong structure code move to util
//   //return weight by user setting
//   // double getWeightByMetric(double weightInLbs) {
//   //   var value =
//   //       sharedPrefService.getString(TrakrefAPIService.SelectedProfileTRKey);
//   //   dynamic resultMap = value != null ? jsonDecode(value) : null;
//   //   print("resultMap $resultMap");
//   //   if (resultMap != null) {
//   //     var user = InfoUserModel.fromJson(resultMap);
//   //     if (user.user?.weightUnits == "Kgs") {
//   //       return weightInLbs / 2.205;
//   //     }
//   //   }
//   //   return weightInLbs;
//   // }

//   //wrong structure code need move to util
//   //return lbs for send to backend
//   double getLbsWeight(double weight) {
//     var value =
//         sharedPrefService.getString(TrakrefAPIService.SelectedProfileTRKey);
//     dynamic resultMap = value != null ? jsonDecode(value) : null;
//     print("resultMap $resultMap");
//     if (resultMap != null) {
//       var user = InfoUserModel.fromJson(resultMap);
//       if (user.user?.weightUnits == "Kgs") {
//         return weight * 2.205;
//       }
//     }
//     return weight;
//   }

//   Future<bool> _setValues(String key, String val) async {
//     return sharedPrefService.setString(key, val);
//   }

//   Future<String?> _getValue(String key) async {
//     return sharedPrefService.getString(key);
//   }

//   Future<bool> setSelectedAccount(Account acc) async {
//     String accountString = jsonEncode(acc);
//     return _setValues(TrakrefAPIService.SelectedAccountTRKey, accountString);
//   }

//   Future<bool> setInstanceID(String instanceID) async {
//     return _setValues(TrakrefAPIService.InstanceIDTRKey, instanceID);
//   }

//   Future<String?> getInstanceID() async {
//     return _getValue(TrakrefAPIService.InstanceIDTRKey);
//   }

//   Future<String?> getAzureAccessTokenExpirationTime() async {
//     return await _getValue(TrakrefAPIService.AzureAccessTokenExpirationTime);
//   }

//   Future<bool> resetLanguageSetting() async {
//     var englishCode = "en";
//     await _setValues('language_code', englishCode);
//     await _setValues('country_code', '');
//     return true;
//   }

//   Future<InfoUserModel> getSelectedProfile() async {
//     String? userString =
//         await _getValue(TrakrefAPIService.SelectedProfileTRKey);
//     Map<String, dynamic> userMap = jsonDecode(userString!);
//     InfoUserModel user = InfoUserModel.fromJson(userMap);
//     return user;
//   }

//   //useless code
//   // String? getLocalWeightUnit() {
//   //   var value =
//   //       sharedPrefService.getString(TrakrefAPIService.SelectedProfileTRKey);
//   //   dynamic resultMap = jsonDecode(value!);
//   //   var user = InfoUserModel.fromJson(resultMap);
//   //   return user.user!.weightUnits;
//   // }

//   String? getSelectedAccount() {
//     return sharedPrefService.getString(TrakrefAPIService.SelectedAccountTRKey);
//   }

//   // String? getInstanceID() {
//   //   return sharedPrefService.getString(TrakrefAPIService.InstanceIDTRKey);
//   // }

//   void setBoolToHintsScan({required bool hintScanBool}) async {
//     await sharedPrefService.setBool(SharedPrefKeys.boolValue, hintScanBool);
//   }

//   // void setSelectedAccount(AccountModel acc) async {
//   //   String accountString = jsonEncode(acc);
//   //   sharedPrefService.setString(
//   //       TrakrefAPIService.SelectedAccountTRKey, accountString);
//   // }
// }
