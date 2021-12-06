import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/images/home_images.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key, required this.googleSignIn})
      : super(key: key);

  final googleSignIn;

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: login,
      child: Container(
        width: 260.0,
        height: 60.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Google_SignIn_Image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
