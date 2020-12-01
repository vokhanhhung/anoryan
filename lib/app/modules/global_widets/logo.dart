import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/chat.json');
  }
}
