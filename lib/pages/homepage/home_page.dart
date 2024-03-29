import 'package:flutter/material.dart';
import 'package:hello_howrld/model/instituicao/instituicao.dart';
import 'package:hello_howrld/pages/app/app_controller.dart';
import 'package:hello_howrld/pages/clientes/client_list.dart';
import 'package:hello_howrld/pages/user/user_preferences.dart';
import 'package:logger/logger.dart';

class Homepage extends StatefulWidget {
  final String title;
  final Instituicao instituicao;

  const Homepage({Key? key, required this.title, required this.instituicao})
      : super(key: key);

  @override
  State<Homepage> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        toolbarHeight: 60.0,
        /*,
          backgroundColor: Colors.red,*/
        actions: [
          Column(
            children: [
              FloatingActionButton(
                  heroTag: "logout",
                  tooltip: "Sair",
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  splashColor: const Color.fromARGB(0, 0, 0, 0),
                  focusColor: const Color.fromARGB(0, 0, 0, 0),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Icon(
                    Icons.door_front_door_rounded,
                    grade: 0,
                    fill: 0,
                    shadows: null,
                    size: 40.0,
                  )),
            ],
          ),
        ],
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Icon(
                        Icons.analytics_rounded,
                        color: Color.fromARGB(255, 0, 81, 255),
                        size: 250.0,
                      ),
                      Title(
                          title: "Estatisticas do negócio",
                          color: AppController.instance.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                          child: const Text(
                            "Estatisticas do negócio",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ))
                    ])),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ClientList();
                      }));
                    },
                    child: Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Icon(
                            Icons.monetization_on_rounded,
                            color: Color.fromARGB(255, 0, 255, 51),
                            size: 250.0,
                          ),
                          Title(
                              title: "Cobranças",
                              color: AppController.instance.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                              child: const Text(
                                "Cobranças",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ))
                        ]))),
              ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 21, 255),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const UserPreferences();
          }));
        },
        child: const Icon(Icons.person),
      ),
    );

    /* (Container(
            width: 200,
            height: 200,
            color: Colors.black,
            child: Center(
                child: Container(width: 50, height: 50, color: Colors.red))));
    */
    /* Center(
            child: GestureDetector(
          child: Text('Contando: $counter',
              textDirection: TextDirection.ltr,
              style: const TextStyle(fontSize: 50.0)),
          onTap: () {},
        )));*/

    /* MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Container(
            child: GestureDetector(
                child: Center(child: Text('Flutterando: $counter')),
                onTap: () {
                  setState(() {
                    counter++;
                  });
                }))); */
  }
}
