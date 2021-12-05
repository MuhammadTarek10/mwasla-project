// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';



GestureDetector TripCard(String image) {
    return GestureDetector(
      onTap: () {print(image);},
      child: Image(image: AssetImage(image)),
    );
  }