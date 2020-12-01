import 'package:anoryan/app/modules/global_widets/logo.dart';
import 'package:anoryan/app/modules/global_widets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/register/controllers/register_controller.dart';

import 'package:velocity_x/velocity_x.dart';

class RegisterView extends GetView<RegisterController> {
  Widget _buildWelcomeText() =>
      'Welcome newbie. Let\'s sign up now '.text.size(15).semiBold.make();

  Widget _buildEmailTextField() => MyTextField(
        hintText: 'Email',
        controller: controller.emailController,
        prefixIcon: Icon(Icons.email),
      );

  Widget _buildPasswordTextField() => MyTextField(
        hintText: 'Password',
        controller: controller.passController,
        prefixIcon: Icon(Icons.email),
      );

  Widget _buildSignUpButton(BuildContext context) => 'Sign up'
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
        () async => await controller.signUp(),
      );

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
        20.heightBox,
        _buildSignUpButton(context),
      ].column().centered().pSymmetric(h: 30).scrollVertical(),
    );
  }
}
