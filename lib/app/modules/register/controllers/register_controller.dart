import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:anoryan/app/modules/global_widets/my_snack_bar.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final resultSignUp =
        await _authService.signUp(emailController.text, passController.text);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
        await Future.delayed(2.seconds);
        emailController.text = '';
        passController.text = '';
      },
      (unit) async {
        showSuccessSnackBar('Register success');
        await Future.delayed(2.seconds);
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
