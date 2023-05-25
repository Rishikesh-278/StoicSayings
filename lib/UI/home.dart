import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoicsayings/components/drawer.dart';
import 'package:http/http.dart' as http;
import '../bloc/ApiCall.dart';
import '../bloc/ApiCallState.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MyBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "HomePage",
              style: TextStyle(fontSize: 30),
            ),
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
                Container(
                  padding: EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey,
                          Colors.white30,
                        ]),
                    border: Border.all(width: 1, color: Colors.black87),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Expanded(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                      " It has survived not only five centuries, but also the leap into electronic typesetting, "
                      "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset "
                      "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
                      "Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontFamily: "Philosopher-Regular"),
                    ),
                  ),
                ),
                SizedBox(
                    width: 10,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.copy_rounded)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
