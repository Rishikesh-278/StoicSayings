import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoicsayings/components/drawer.dart';
import 'package:http/http.dart' as http;
import '../bloc/ApiCall.dart';
import '../bloc/ApiCallState.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MyBloc(),
        child: Scaffold(
          backgroundColor: Color(0xFF141414),
          appBar: AppBar(
            backgroundColor: Color(0xFF141414),
            title: const Text("HomePage"),
            centerTitle: true,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 0.1,
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          drawer: drawer(),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<MyBloc>().add(MyApiCallEvent());
            },
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 150,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text("")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
