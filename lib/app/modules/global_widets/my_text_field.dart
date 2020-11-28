import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      controller: controller,
      hint: hintText,
      prefixIcon: prefixIcon,
      borderType: VxTextFieldBorderType.roundLine,
      borderColor: Vx.gray900,
      borderRadius: 10.0,
    );
  }
}
