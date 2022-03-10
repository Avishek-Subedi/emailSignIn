// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hunxa/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("learinging")),
      body: isLoading
          ? CircularProgressIndicator.adaptive()
          : Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "email"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "password"),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // print(_email);

                        try {
                          setState(() {
                            isLoading = true;
                          });

                          UserCredential sandesh =
                              await auth.signInWithEmailAndPassword(
                                  email: _email, password: _password);
                          print("result from firebase");
                          print(sandesh);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });

                          print("hamro exception");
                          var snackBar = SnackBar(
                            content: Text((e.toString() == null)
                                ? "Invalid Credentials"
                                : e.toString()),
                          );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          print(e.toString());
                        }
                      },
                      child: Text("Sigin in"),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Text("Sigin Up"),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
