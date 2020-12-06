import 'package:anoryan/app/modules/home/controllers/home_controller.dart';
import 'package:anoryan/app/modules/home/views/findFriendTab.dart';
import 'package:anoryan/app/modules/home/views/settingsTab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'messageTab.dart';

class HomeView extends GetView<HomeController> {
  final HomeController c = Get.put(HomeController());

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MessageTab(),
    FindFriendTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anonyran'),
        ),
        body:
        Center(
          child: Obx(()=> _widgetOptions[c.selectedIndex.value],
          ),
        ),
        bottomNavigationBar: Obx(() =>
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Tin nhắn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Tìm bạn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Cài đặt',
                ),
              ],
              currentIndex: c.selectedIndex.value,
              selectedItemColor: Colors.blue[500],
              onTap: c.onItemTapped,
            ),
        )
    );
  }
}
