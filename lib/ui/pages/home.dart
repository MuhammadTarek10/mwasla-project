import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mwasla_app/ui/google_maps/google_map.dart';
import 'package:mwasla_app/ui/pages/filters.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.pageController})
      : super(key: key);

  final pageController;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Filters(pageController: widget.pageController));
  }
}
