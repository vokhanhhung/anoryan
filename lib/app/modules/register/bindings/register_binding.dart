import 'package:get/get.dart';

import 'package:anoryan/app/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
