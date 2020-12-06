import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is ChatPage'),
      ),
      body: Center(
        child: Text('This is ChatPage', style: TextStyle(fontSize: 22, color: Colors.green),),
      ),
    );
  }
}