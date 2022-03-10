// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hunxa/homepage.dart';
// import 'package:hunxa/gmailsignin.dart';
// import 'package:hunxa/homepage.dart';
import 'package:hunxa/sandesh.dart';
// import 'package:hunxa/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}
