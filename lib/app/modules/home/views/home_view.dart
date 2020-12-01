import 'package:anoryan/app/modules/global_widets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/home/controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
      [
        Spacer(),
        'Sign out'.text.xl3.make(),
        5.widthBox,
        Icon(Icons.logout, size: 40),
      ].row().p12(),
      20.heightBox,
      Logo(),
      20.heightBox,
    ].column().p12());
  }
}
