import 'package:anoryan/app/modules/global_widets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/login/controllers/login_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends GetView<LoginController> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Lottie.asset('assets/chat.json'),
        20.heightBox,
        'Hey, let\'s started sign in now'.text.xl2.semiBold.make(),
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
        10.heightBox,
        'No account. Sign up now'
            .text
            .color(Vx.blue700)
            .size(9)
            .underline
            .make()
            .objectBottomRight(),
        10.heightBox,
        'Sign in'
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
            .onTap(() => onSignIn),
        10.heightBox,
        [
          Container(
            height: 1,
            width: 100,
            color: Vx.black,
          ),
          4.widthBox,
          'OR'.text.make(),
          4.widthBox,
          Container(
            height: 1,
            width: 100,
            color: Vx.black,
          ),
        ].row().centered(),
        20.heightBox,
        [
          Image.asset(
            'assets/facebook.png',
            height: 40,
            width: 40,
          ).onTap(() => onFacebookSignIn),
          20.widthBox,
          Image.asset(
            'assets/google.png',
            height: 40,
            width: 40,
          ).onTap(() => onGoogleSignIn),
        ].row().centered()
      ].column().centered().pSymmetric(h: 30),
    );
  }

  Future<void> onFacebookSignIn() async {
    await controller.signInWithFacebook();
  }

  Future<void> onGoogleSignIn() async {
    await controller.signInWithGoogle();
  }

  Future<void> onSignIn() async {
    await controller.signIn(_emailController.text, _passController.text);
  }
}
