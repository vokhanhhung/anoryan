import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _authService = Get.find<AuthService>();
  Future<void> signInWithGoogle() async {
    final resultSignUp = await _authService.signInWithGoogle();
    resultSignUp.fold(
      (error) async {
        Get.snackbar(
          'Error',
          error,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        await Future.delayed(Duration(seconds: 2));
      },
      (unit) async {
        Get.snackbar(
          'Success',
          'Sign in success by Google',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.blue,
          backgroundColor: Colors.white,
        );
        await Future.delayed(Duration(seconds: 2));
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    final resultSignUp = await _authService.signInWithFacebook();
    resultSignUp.fold(
      (error) async {
        Get.snackbar(
          'Error',
          error,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        await Future.delayed(Duration(seconds: 2));
      },
      (unit) async {
        Get.snackbar(
          'Success',
          'Sign in success by Faccebook',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.blue,
          backgroundColor: Colors.white,
        );
        await Future.delayed(Duration(seconds: 2));
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
