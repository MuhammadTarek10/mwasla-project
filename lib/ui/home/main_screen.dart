import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/colors/home_colors.dart';
import 'package:mwasla_app/ui/home/home_navigation_bar.dart';
import 'package:mwasla_app/ui/images/home_images.dart';
import 'package:mwasla_app/ui/pages/allPages.dart';
import 'package:mwasla_app/ui/test/test_parameters.dart';
import 'home_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  PageController pageController = PageController(initialPage: 2);
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(name: TEST_NAME, image: TEST_IMAGE),
      bottomNavigationBar: BottomNavigationBarCustomWidget(pageController: pageController, selectedIndex: selectedIndex),
      appBar: AppBar(
          backgroundColor: HOME_APPBAR_COLOR,
          title: const Image(image: AssetImage(MWASLA_LOGO), height: 40.0)),
      body: AllPages(pageController: pageController),
    );
  }
}

