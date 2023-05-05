import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication.dart';
import 'package:stoicsayings/constants.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100),
              const CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/05/62/25/27/360_F_562252718_OGtw1RkPlWIPghxdYtLXgpHSc9BHWzdM.jpg"),
              ),
              const SizedBox(height: 20),
              const Text(
                "StoicSayings",
                style: kTextStyle1,
              ),
              const SizedBox(height: 40),
              GestureDetector(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 0.5, color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/GoogleLogo.png',
                        scale: 80,
                      ),
                      const SizedBox(
                          width: 10
                      ),
                      const Text(
                        "Login ",
                        style: kTextStyle1,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Authentication().SignInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}