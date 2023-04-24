import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Authentication/authentication.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: const TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Authentication().signOut();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: const <Widget>[Text("This is your home page")],
        ),
      ),
    );
  }
}
