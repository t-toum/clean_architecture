import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState>? navigatorKey;
  // make this nullable by adding '?'
  static AppNavigator? _instance;

  AppNavigator._() {
    // initialization and stuff
    navigatorKey = GlobalKey<NavigatorState>();
  }

  factory AppNavigator() {
    _instance ??= AppNavigator._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }
  static void navigateTo(String routeName, {dynamic params}) {
    navigatorKey!.currentState?.pushNamed(routeName, arguments: params);
  }

  static void goBack() {
    navigatorKey!.currentState!.pop();
  }

  static void goBackUntil(String routeName) {
    navigatorKey!.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  static void pushAndRemoveUntil(String routeName, {dynamic params}) {
    navigatorKey!.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: params);
  }

  static void goBackWithData({dynamic data}) {
    navigatorKey!.currentState!.pop(data);
  }

  static navigateToWithData(String routeName, {dynamic params}) {
    return navigatorKey!.currentState?.pushNamed(routeName, arguments: params);
  }
}
