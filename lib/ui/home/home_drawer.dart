// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/colors/home_colors.dart';
import 'package:mwasla_app/ui/test/test_parameters.dart';
import 'package:mwasla_app/ui/widgets/home_drawer_widgets.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: NAVIGATION_DRAWER_COLOR,
        child: ListView(
          children: <Widget>[
            NavigationDrawerHeader(
                name: name, image: Image.asset(image), context: context),
            MenuItem(
                text: MENU_TEXTS[0],
                iconPath: MENU_ICONS[0],
                context: context,
                onClick: () => debugPrint(MENU_TEXTS[0])),
            MenuItem(
                text: MENU_TEXTS[1],
                iconPath: MENU_ICONS[1],
                context: context,
                onClick: () => debugPrint(MENU_TEXTS[1])),
            MenuItem(
                text: MENU_TEXTS[2],
                iconPath: MENU_ICONS[2],
                context: context,
                onClick: () => debugPrint(MENU_TEXTS[2])),
            MenuItem(
                text: MENU_TEXTS[3],
                iconPath: MENU_ICONS[3],
                context: context,
                onClick: () => debugPrint(MENU_TEXTS[3])),
          ],
        ),
      ),
    );
  }
}

