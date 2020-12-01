import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:anoryan/app/modules/global_widets/my_snack_bar.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<void> signInWithGoogle() async {
    final resultSignUp = await _authService.signInWithGoogle();
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with google success');
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    final resultSignUp = await _authService.signInWithFacebook();
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
        await Future.delayed(Duration(seconds: 2));
      },
      (unit) async {
        showSuccessSnackBar('Sign in with facebook success');
        await Future.delayed(Duration(seconds: 2));
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }

  Future<void> signIn() async {
    final resultSignUp =
        await _authService.signIn(emailController.text, passController.text);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
        await Future.delayed(Duration(seconds: 2));
        emailController.text = '';
        passController.text = '';
      },
      (unit) async {
        showSuccessSnackBar('Sign in success');
        await Future.delayed(Duration(seconds: 2));
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
