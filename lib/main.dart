import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Authentication/authentication.dart';
import 'Authentication/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/ApiCall.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => MyBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "WorkSans",
        brightness: Brightness.dark,
      ),
      home: Authentication().handleAuthState(),
    );
  }
}