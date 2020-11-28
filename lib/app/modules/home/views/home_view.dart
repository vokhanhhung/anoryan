import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anoryan/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.user != null ? controller.user.value.email : 'No user',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
