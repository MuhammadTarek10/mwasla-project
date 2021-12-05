import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'package:mwasla_app/ui/main/register_page.dart';
import 'login_page.dart';

class MwaslaApp extends StatefulWidget {
  const MwaslaApp({Key? key}) : super(key: key);

  @override
  _MwaslaAppState createState() => _MwaslaAppState();
}

class _MwaslaAppState extends State<MwaslaApp> {

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 1),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterPage())));
    return Container(color: Colors.green);
  }
}