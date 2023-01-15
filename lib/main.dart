import 'package:flutter/material.dart';
import 'package:hive_figh/pages/pages_lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Five RHB',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: "login",
      routes: {
        "login": (context) => const LoginPage(),
        "/": (context) => const MainPage(),
      },
    );
  }
}
