import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stoicsayings/Authentication/login_page.dart';
import 'package:stoicsayings/UI/home.dart';

class Authentication
{

  handleAuthState()
  {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot)
        {
          if(snapshot.hasData)
          {
            return Home();
          }
          else
          {
            return const Login_Page();
          }
        }
    );
  }
  
  SignInWithGoogle()
  async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =  await googleUser!.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut()
  {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }
}