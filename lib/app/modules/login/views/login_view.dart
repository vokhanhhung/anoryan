import 'package:anoryan/app/modules/global_widets/logo.dart';
import 'package:anoryan/app/modules/global_widets/my_text_field.dart';
import 'package:anoryan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/login/controllers/login_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends GetView<LoginController> {
  Widget _buildWelcomeText() =>
      'Hey, let\'s started sign in now'.text.xl2.semiBold.make();

  Widget _buildEmailTextField() => MyTextField(
        hintText: 'Email',
        controller: controller.emailController,
        prefixIcon: Icon(Icons.email),
      );

  Widget _buildPasswordTextField() => MyTextField(
        hintText: 'Password',
        controller: controller.passController,
        prefixIcon: Icon(Icons.lock),
      );

  Widget _buildNoAccountText() => 'No account. Sign up now'
      .text
      .blue700
      .size(9)
      .underline
      .make()
      .objectBottomRight()
      .onTap(
        () => Get.offNamed(Routes.REGISTER),
      );

  Widget _buildDivider() => [
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
      ].row().centered();

  Widget _buildSignInButton(BuildContext context) => 'Sign in'
      .text
      .white
      .xl2
      .makeCentered()
      .box
      .blue700
      .roundedSM
      .p4
      .makeCentered()
      .h(50)
      .w60(context)
      .onTap(
        () async => await controller.signIn(),
      );

  Widget _buildGoogleAndFacebookSignInButton() => [
        Image.asset(
          'assets/facebook.png',
          height: 40,
          width: 40,
        ).onTap(() async => await controller.signInWithFacebook()),
        20.widthBox,
        Image.asset(
          'assets/google.png',
          height: 40,
          width: 40,
        ).onTap(() async => await controller.signInWithGoogle()),
      ].row().centered();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
      Logo(),
      20.heightBox,
      _buildWelcomeText(),
      30.heightBox,
      _buildEmailTextField(),
      20.heightBox,
      _buildPasswordTextField(),
      10.heightBox,
      _buildNoAccountText(),
      10.heightBox,
      _buildSignInButton(context),
      10.heightBox,
      _buildDivider(),
      20.heightBox,
      _buildGoogleAndFacebookSignInButton(),
    ].column().centered().pSymmetric(h: 30).scrollVertical());
  }
}
