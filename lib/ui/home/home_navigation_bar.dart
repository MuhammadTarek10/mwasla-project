// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mwasla_app/page_provider.dart';
import 'package:mwasla_app/ui/colors/home_colors.dart';
import 'package:mwasla_app/ui/test/test_parameters.dart';

class BottomNavigationBarCustomWidget extends StatefulWidget {
  PageController pageController;
  int selectedIndex;

  BottomNavigationBarCustomWidget(
      {Key? key, required this.pageController, required this.selectedIndex})
      : super(key: key);

  @override
  _BottomNavigationBarCustomWidgetState createState() =>
      _BottomNavigationBarCustomWidgetState();
}

class _BottomNavigationBarCustomWidgetState
    extends State<BottomNavigationBarCustomWidget> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi, size: 30),
            label: BOTTOM_NAVIGATION_TITLES[0],
            backgroundColor: BOTTOM_NAVIGATION_COLORS[0]),
        BottomNavigationBarItem(
            icon: Icon(Icons.train, size: 30),
            label: BOTTOM_NAVIGATION_TITLES[1],
            backgroundColor: BOTTOM_NAVIGATION_COLORS[1]),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: BOTTOM_NAVIGATION_TITLES[2],
            backgroundColor: BOTTOM_NAVIGATION_COLORS[2]),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(BOTTOM_NAVIGATION_ICONS[3])),
            label: BOTTOM_NAVIGATION_TITLES[3],
            backgroundColor: BOTTOM_NAVIGATION_COLORS[3]),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(BOTTOM_NAVIGATION_ICONS[4])),
            label: BOTTOM_NAVIGATION_TITLES[4],
            backgroundColor: BOTTOM_NAVIGATION_COLORS[4]),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: SELECTED_ICON_COLOR,
      unselectedItemColor: UNSELECTED_ICON_COLOR,
      onTap: changePage,
    );
  }

  void changePage(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    widget.pageController.animateToPage(index,
        duration: Duration(microseconds: 500), curve: Curves.ease);
  }
}
