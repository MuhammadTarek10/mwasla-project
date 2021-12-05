// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/main/mwasla_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child('users');


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MwaslaApp(),
    ),
  );
}

