import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:anoryan/app/modules/register/controllers/register_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
      Lottie.asset('assets/chat.json'),
      20.heightBox,
      'Welcome to anoryan app'.text.xl3.semiBold.makeCentered(),
      30.heightBox,
      20.heightBox,
      'Sign in with Google'
          .text
          .xl2
          .color(Vx.white)
          .makeCentered()
          .box
          .roundedSM
          .color(Vx.red700)
          .p4
          .makeCentered()
          .h(50.0)
          .w60(context)
          .onTap(() async => await controller.signInWithGoogle()),
      20.heightBox,
      'Sign in with facebook'
          .text
          .color(Vx.white)
          .xl2
          .makeCentered()
          .box
          .roundedSM
          .color(Vx.blue700)
          .p4
          .makeCentered()
          .h(50)
          .w60(context)
          .onTap(() async => await controller.signInWithFacebook()),
      20.heightBox,
    ].column().centered());
  }
}
