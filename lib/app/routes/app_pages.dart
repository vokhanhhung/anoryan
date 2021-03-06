import 'package:anoryan/app/modules/register/views/register_view.dart';
import 'package:anoryan/app/modules/register/bindings/register_binding.dart';
import 'package:anoryan/app/modules/login/views/login_view.dart';
import 'package:anoryan/app/modules/login/bindings/login_binding.dart';
import 'package:anoryan/app/modules/home/views/home_view.dart';
import 'package:anoryan/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
   
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginView(), 
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER, 
      page:()=> RegisterView(), 
      binding: RegisterBinding(),
    ),
  ];
}