import 'package:anoryan/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = Rx(Get.find<AuthService>().user);

  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
