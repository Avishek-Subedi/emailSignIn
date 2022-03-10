// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Logged extends StatelessWidget {
  const Logged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("YOu are logged in with google account"),
      ),
    );
  }
}
