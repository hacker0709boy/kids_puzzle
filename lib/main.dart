import 'package:flutter/material.dart';
import 'package:kids_puzzle/controller.dart';
import 'package:kids_puzzle/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => Controller(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dem',
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      home: const HomePage(),
      
    );
  }
}
