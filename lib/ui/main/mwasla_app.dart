import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/home/main_screen.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MwaslaApp extends StatefulWidget {
  const MwaslaApp({Key? key}) : super(key: key);

  @override
  _MwaslaAppState createState() => _MwaslaAppState();
}

class _MwaslaAppState extends State<MwaslaApp> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Reauthenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount? account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isAuth? MainScreen():LoginPage();
  }
}