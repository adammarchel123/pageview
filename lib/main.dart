import 'package:flutter/material.dart';
import 'package:flutter_application_22/main_page.dart';

void main() {
  runApp(const MyApp());
}

//The widgets whose state can not be altered once they are built
class MyApp extends StatelessWidget {
  //Strings are mainly used to represent text
  final String appbarTitle = 'PageView';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appbarTitle,
      //configuration of the overall visual Theme for a MaterialApp or a widget
      theme: ThemeData(primaryColor: Colors.teal, primarySwatch: Colors.teal),
      home: MainPage(
        appbarTitle: appbarTitle,
      ),
    );
  }
}
