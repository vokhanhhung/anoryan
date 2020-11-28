import 'package:anoryan/app/modules/global_widets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/register/controllers/register_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterView extends GetView<RegisterController> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
      Lottie.asset('assets/chat.json'),
      20.heightBox,
      'Welcome newbie. Let\'s sign up now '.text.size(15).semiBold.make(),
      30.heightBox,
      MyTextField(
        hintText: 'Email',
        controller: _emailController,
        prefixIcon: Icon(Icons.email),
      ),
      20.heightBox,
      MyTextField(
        hintText: 'Password',
        controller: _passController,
        prefixIcon: Icon(Icons.lock),
      ),
      20.heightBox,
      'Sign up'
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
          .onTap(() => onSignUp),
    ].column().centered().pSymmetric(h: 30));
  }

  Future onSignUp() async {
    await controller.signUp(_emailController.text, _passController.text);
  }
}
