// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/colors/home_colors.dart';
import 'package:mwasla_app/ui/test/test_parameters.dart';

Widget MenuItem(
      {required String text,
      required String iconPath,
      VoidCallback? onClick,
      required BuildContext context}) {
    const color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      horizontalTitleGap: MediaQuery.of(context).size.width * 0.4,
      leading: ImageIcon(AssetImage(iconPath), color: color),
      title: Text(text, style: TextStyle(color: Colors.white)),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }

Widget NavigationDrawerHeader(
          {required String name,
          required image,
          required BuildContext context}) =>
      InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: const BoxDecoration(
            color: NAVIGATION_DRAWER_HEADER_COLOR,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      INITIAL_TEXT,
                      style: _navigationHeaderTextStyle(),
                    ),
                    Text(
                      name,
                      style: _navigationHeaderTextStyle(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              HeaderAvatar(image: image),
            ],
          ),
        ),
      );

  TextStyle _navigationHeaderTextStyle() {
    return const TextStyle(fontSize: 17.0, color: Colors.white);
  }

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({Key? key, required this.image}) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height * 0.05,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.045,
        child: ClipRRect(
          child: image,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.05),
        ),
      ),
    );
  }
}