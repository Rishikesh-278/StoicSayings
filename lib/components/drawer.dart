import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stoicsayings/constants.dart';
import '../Authentication/authentication.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser!.photoURL!),
          ),
          const SizedBox(height: 10),
          Text(
            FirebaseAuth.instance.currentUser!.displayName!,
            style: kTextStyle1,
          ),
          TextButton(
            onPressed: () {
              Authentication().signOut();
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))))),
            //style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              "Log Out",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}