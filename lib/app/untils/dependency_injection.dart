import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put(AuthService());
  }
}
