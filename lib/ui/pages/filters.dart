import 'package:flutter/material.dart';

Widget Filters({required PageController pageController}) {
  _goToPage(int idx) {
    pageController.animateToPage(idx,
        duration: Duration(microseconds: 500), curve: Curves.ease);
  }

  return Center(
    child: ListView(children: [
      ElevatedButton(onPressed: () => {_goToPage(0)}, child: Text("Taxi")),
      ElevatedButton(onPressed: () => {_goToPage(1)}, child: Text("Train")),
      ElevatedButton(onPressed: () => {_goToPage(3)}, child: Text("Bus")),
      ElevatedButton(onPressed: () => {_goToPage(4)}, child: Text("Tram")),
      
    ]),
  );
}
