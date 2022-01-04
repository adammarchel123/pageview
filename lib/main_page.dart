import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_22/data.dart';
import 'package:flutter_application_22/page_circle_indicator.dart';
import 'package:flutter_application_22/page_entry_widget.dart';

//Stateful Widgets are dynamic widgets
class MainPage extends StatefulWidget {
  final String appbarTitle;
  const MainPage({Key? key, required this.appbarTitle}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //ValueNotifier dapat menyimpan satu nilai. Nilai itu sendiri dapat berupa jenis apa pun. Itu bisa berupa int, String, bool, atau tipe data Anda sendiri
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    //The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appbarTitle),
      ),
      //The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other
      body: Stack(
        children: [
          //PageView is a Flutter widget that creates scrollable pages on the screen
          PageView.builder(
            onPageChanged: (value) => currentPageNotifier.value = value,
            controller: PageController(initialPage: currentPageNotifier.value),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return PageEntryWidget(entry: pages[index]);
            },
          ),
          //menempatkan widget secara sewenang-wenang di atas satu sama lain
          //It is usually used to position child widgets in Stack widget or similar
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: PageCircleIndicator(
                currentPageNotifier: currentPageNotifier,
                itemCount: pages.length),
          )
        ],
      ),
    );
  }


}
