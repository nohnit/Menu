import 'package:flutter/material.dart';
import 'package:ornekproje/Screen/homescreen.dart';

void main() {
  runApp(Uygulamam());
}

class Uygulamam extends StatelessWidget {
  const Uygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Nunito"),
        home: HomeScreen());
  }
}
