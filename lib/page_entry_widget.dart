import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_22/page_entry.dart';

class PageEntryWidget extends StatefulWidget {
  final PageEntry entry;

  const PageEntryWidget({Key? key, required this.entry}) : super(key: key);

  @override
  State<PageEntryWidget> createState() => _PageEntryWidgetState();
}

class _PageEntryWidgetState extends State<PageEntryWidget> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    scrollToEnd(millisecond: 1000);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //build different layouts depending on a given Orientation
    return OrientationBuilder(
      builder: (context, orientation) {
        scrollToEnd(millisecond: 100);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          //ListView is used to group several items in an array and display them in a scrollable list
          child: ListView(
            controller: controller,
            children: [
              Image.asset(
                widget.entry.image,
                fit: BoxFit.cover,
              ),
              //It is somewhat similar to a Container widget with fewer properties
              SizedBox(height: 8),
              Text(
                widget.entry.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              //Text is a widget in Flutter that allows us to display a string of text with a single line in our application
              Text(
                widget.entry.description,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        );
      },
    );
  }

  void scrollToEnd({required int millisecond}) {
    Timer(Duration(milliseconds: millisecond), () {
      if (!controller.hasClients) return;
      controller.jumpTo(controller.position.maxScrollExtent);
    });
  }
}
