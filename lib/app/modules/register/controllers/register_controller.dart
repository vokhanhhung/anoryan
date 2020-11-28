import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:anoryan/app/modules/global_widets/my_snack_bar.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _authService = Get.find<AuthService>();
  Future<void> signUp(String email, String password) async {
    final resultSignUp = await _authService.signUp(email, password);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Register success');
        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }
}
