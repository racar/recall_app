import 'package:flutter/material.dart';
import 'package:recall_app/screens/splash/splash_page.dart';

Future<void> main () async {


  runApp(RecallApp());
}

//void main() => runApp(RecallApp());

class RecallApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check Your vehicules',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.red
      ),
      home: Splash(),
    );
  }
}

