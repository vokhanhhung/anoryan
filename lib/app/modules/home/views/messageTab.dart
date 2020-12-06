import 'package:anoryan/app/modules/home/views/chat_view.dart';
import 'package:anoryan/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTab extends GetView<HomeView> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add transaction',
            child: Icon(Icons.add),
          ),
          body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  Container(
                      height: 600,
                      child: ListView.builder(
                          itemBuilder: (context, index){
                            return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                elevation: 10,
                                child: InkWell(
                                    onTap: () => Get.to(ChatView()),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                    Padding(padding: EdgeInsets.all(10),),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(top:10)),
                                        Text('Tên user',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text('Nội dung tin nhắn cuối',
                                            style: TextStyle(fontSize: 18)),
                                        Padding(padding: EdgeInsets.only(bottom:10)),
                                      ],
                                    ),
                                    Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text('11:00',
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(right: 10),)
                                          ],
                                        )
                                    ),
                                    ],
                                  )
                                ),
                            );
                          }
                      )
                  ),
                ],
              ),
            ),
          )
      );
  }
}
