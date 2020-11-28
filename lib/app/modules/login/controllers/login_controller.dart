import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:anoryan/app/modules/global_widets/my_snack_bar.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
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

  Future<void> signIn(String email, String password) async {
    final resultSignUp = await _authService.signIn(email, password);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
        await Future.delayed(Duration(seconds: 2));
      },
      (unit) async {
        showSuccessSnackBar('Sign in success');
        await Future.delayed(Duration(seconds: 2));
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }
}
