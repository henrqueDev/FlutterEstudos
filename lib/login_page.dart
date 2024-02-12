// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// Flutter code sample for [MaterialStateProperty].

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.25,
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
                shadowColor: Colors.black,
                surfaceTintColor: Colors.black,
                color: Color.fromARGB(80, 0, 0, 0),
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/league_lendas_icon.png',
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.height / 6,
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        TextField(
                            onChanged: (text) {
                              email = text;
                            },
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hoverColor: Colors.white,
                                focusColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "E-mail")),
                        Padding(padding: EdgeInsets.all(8.0)),
                        TextField(
                          onChanged: (text) {
                            password = text;
                          },
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Senha",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        getColor)),
                            onPressed: () {
                              if (email == "teste" && password == "teste") {
                                Navigator.pushReplacementNamed(
                                    context, "/homepage");
                              }
                            },
                            child: const Text('Entrar',
                                style: TextStyle(color: Colors.white)))
                      ],
                    )))),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromARGB(255, 37, 37, 37);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background_lol.jpg',
            fit: BoxFit.cover,
          )),
      _body(),
    ]));
  }
}
