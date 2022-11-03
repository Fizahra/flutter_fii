import 'package:flutter/material.dart';
import 'package:flutter_fii/page/counter_page.dart';
import 'package:flutter_fii/page/main_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
