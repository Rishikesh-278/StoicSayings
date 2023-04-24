import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentication.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Authentication().SignInWithGoogle();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: const Text(
                  "Login with google",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
