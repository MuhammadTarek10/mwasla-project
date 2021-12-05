// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/pages/taxi.dart';
import 'package:mwasla_app/ui/pages/train.dart';
import 'package:mwasla_app/ui/pages/tram.dart';
import 'bus.dart';
import 'home.dart';

Widget AllPages({required PageController pageController}) {

  return PageView(
    physics: NeverScrollableScrollPhysics(),
    controller: pageController,
    children: [
      TaxiPage(),
      TrainPage(),
      HomePage(pageController: pageController),
      BusPage(),
      TramPage(),
    ],
  );
}
