// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hunxa/loggedin.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Google Demo (Logged ' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  child: Text('Sign In'),
                  onPressed: user != null
                      ? null
                      : () async {
                          await _googleSignIn.signIn();
                          setState(() {});
                        }),
              ElevatedButton(
                  child: Text('Sign Out'),
                  onPressed: user == null
                      ? null
                      : () async {
                          await _googleSignIn.signOut();
                          setState(() {});
                        }),
            ],
          ),
        ),
      ),
      // child: Scaffold(
      //   body: Container(
      //     margin: EdgeInsets.all(25),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         TextField(
      //             decoration: InputDecoration(hintText: "email"),
      //             keyboardType: TextInputType.emailAddress),
      //         TextField(
      //             decoration: InputDecoration(hintText: "password"),
      //             obscureText: true),
      //         Container(
      //             margin: EdgeInsets.all(30),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Icon(
      //                   Icons.mail,
      //                   color: Colors.green,
      //                 ),
      //                 ElevatedButton(
      //                     onPressed: () async {
      //                       await _googleSignIn.signIn();
      //                       setState(() {});
      //                     },
      //                     child: Text("sin in with google")),
      //               ],
      //             ))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
