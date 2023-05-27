import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              style: TextStyle(fontSize: 20),
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
                          Colors.grey,
                        ]),
                    border: Border.all(width: 1, color: Colors.black87),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Expanded(
                    child: SelectableText(
                      "That’s why the philosophers warn us not to be satisfied with mere learning,"
                          " but to add practice and then training. For as time passes we forget what "
                          "we learned and end up doing the opposite, and hold opinions the opposite "
                          "of what we should. – Epictetus,",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontFamily: "Philosopher-Regular"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.copy_rounded)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.download))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
